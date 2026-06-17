#!/usr/bin/env python3
from typing import Iterable, override
from pyoptional.pyoptional import PyOptional
from pystarworldsturbo.common.action_result import ActionResult
from pystarworldsturbo.common.action_outcome import ActionOutcome
from pystarworldsturbo.common.message import BccMessage

from vacuumworld import run
from vacuumworld.model.actions.vwactions import VWAction
from vacuumworld.model.actions.vwidle_action import VWIdleAction
from vacuumworld.model.actions.vweffort import VWActionEffort
from vacuumworld.model.actor.mind.surrogate.vwactor_mind_surrogate import VWActorMindSurrogate
from vacuumworld.model.actions.vwmove_action import VWMoveAction
from vacuumworld.model.actions.vwturn_action import VWTurnAction
from vacuumworld.common.vwdirection import VWDirection
from vacuumworld.common.vwobservation import VWObservation
from vacuumworld.model.environment.vwlocation import VWLocation
from vacuumworld.common.vworientation import VWOrientation
from pystarworldsturbo.common.action_outcome import ActionOutcome
from vacuumworld.model.actions.vwbroadcast_action import VWBroadcastAction
from vacuumworld.model.actions.vwactions import VWPhysicalAction
from vacuumworld.model.actions.vwactions import VWCommunicativeAction
from vacuumworld.model.actions.vwbroadcast_action import VWBroadcastAction
from vacuumworld.model.actions.vweffort import VWActionEffort
from vacuumworld.model.actor.mind.surrogate.vw_llm_actor_mind_surrogate import VWLLMActorMindSurrogate

from google.genai.types import GenerateContentResponse
from google.genai.errors import ClientError, ServerError
import re


class MyMind(VWLLMActorMindSurrogate):
    def __init__(self) -> None:
        # A `.env` file must be present in the same directory as this script, containing the GEMINI_API_KEY variable.
        super(MyMind, self).__init__(dot_env_path=".env")
        self.__intended_turn: VWDirection | None = None
        self.cycle = 0
        self.beforeorient = "None"
        self.deduced_n: int | None = None
        # Add here all the attributes you need/want.

    def percepts(self, turned_left, turned_right):
        cur_orient = self.get_own_orientation()
        obs = self.get_latest_observation()
        left = obs.get_left()
        right = obs.get_right()
        wall_current = obs.is_wall_immediately_ahead()
        wall_ahead = obs.is_wall_one_step_ahead()
        wall_right = right.is_empty() or right.or_else_raise().has_wall_on(VWOrientation.north) or right.or_else_raise().has_wall_on(VWOrientation.east) or right.or_else_raise().has_wall_on(VWOrientation.south)
        wall_left = left.is_empty() or left.or_else_raise().has_wall_on(VWOrientation.north) or left.or_else_raise().has_wall_on(VWOrientation.east) or left.or_else_raise().has_wall_on(VWOrientation.south)
        forward_off_grid = obs.get_forward().is_empty()
        fr = obs.get_forwardright()
        fl = obs.get_forwardleft()
        wall_ahead_right = fr.is_empty() or fr.or_else_raise().has_wall_on(VWOrientation.north) or fr.or_else_raise().has_wall_on(VWOrientation.east) or fr.or_else_raise().has_wall_on(VWOrientation.south)
        wall_ahead_left = fl.is_empty() or fl.or_else_raise().has_wall_on(VWOrientation.north) or fl.or_else_raise().has_wall_on(VWOrientation.east) or fl.or_else_raise().has_wall_on(VWOrientation.south)
        
        outcomes = obs.get_latest_actions_outcomes_as_dict()
        moved = (
                VWMoveAction in outcomes and
                ActionOutcome.success in outcomes[VWMoveAction]
            )
        move_failed = (
                VWMoveAction in outcomes and
                ActionOutcome.success not in outcomes[VWMoveAction]
            )
        percept = f"You are facing {cur_orient} and went from {self.beforeorient} -> {cur_orient}, "
        if self.cycle == 0:
            percept += "no previous action as this is the start. "
        if turned_right:
            percept += "You turned right one cycle ago. "
        elif turned_left:
            percept += "You turned left one cycle ago. "
        if moved:
            percept += "You moved forward one cycle ago. "
        elif move_failed:
            percept += "You tried to move forward, it was impossible. "
        if forward_off_grid:
            percept += "the boundary is directly ahead, "
        elif wall_ahead:
            percept += "the cell ahead has a boundary (Wall), you can move forward to the cell but not further forward. "
        else:
            percept += "there is no wall tile ahead, you can move forward and further forward.  "
        if wall_right:
            percept += "the cell to your right has a wall, you can turn right and move forward to the cell. "
        else:
            percept += "there is no wall to your right tile, you can turn right and move forward to the cell. "

        if wall_left:
            percept += "the cell to your left has a wall, you can turn left and move forward to the cell. "
        else:
            percept += "there is no wall to your left tile, you can turn left and move forward to the cell. "
        
        if wall_ahead_right:
            percept += "the cell to your forward right has a wall, you can move forward right to the cell. "
        else:
            percept += "there is no wall to your forward right tile, you can move forward right to the cell. "
        
        if wall_ahead_left:
            percept += "the cell to your forward left has a wall, you can move forward left to the cell."
        else:
            percept += "there is no wall to your forward left tile."
        self.beforeorient = cur_orient
        return percept

    @override
    def revise(self) -> None:
        None

    @override
    def decide(self) -> Iterable[VWAction]:
        if self.deduced_n is not None:
            return [VWIdleAction()]

        obs = self.get_latest_observation()
        outcomes = obs.get_latest_actions_outcomes_as_dict()
        turned_left = False
        turned_right = False
        if VWTurnAction in outcomes and ActionOutcome.success in outcomes[VWTurnAction]:
            if self.__intended_turn == VWDirection.right:
                turned_right = True
        if VWTurnAction in outcomes and ActionOutcome.success in outcomes[VWTurnAction]:
            if self.__intended_turn == VWDirection.left:
                turned_left = True
        percept = self.percepts(turned_left, turned_right)
        # Replace this trivial decision process with something meaningful.
        prompt = (
            f"You are in a grid of n by n size. Your goal is to determine the n by moving around the grid. "
            f"You will be given information of 3x2 of the grid around you. The information at cycle {self.cycle}: "
            + percept
            + "\n Based on the above information, decide your next action. You can choose to move forward, turn left, turn right, speak (broadcast a message), or do nothing (idle). "
            "Respond with only one action in the format of ActionName(parameters). For example, VWMoveAction() for moving forward, VWTurnAction(left) for turning left, VWTurnAction(right) for turning right. Only respond with the action, do not include any explanations or additional text. "
            "If you have enough information to deduce the value of n, respond with SpeakAction('n=the deduced value of n'). For example, if you deduce that n is 5, respond with SpeakAction('n=5').")
        
        try: 
            return [self.decide_physical_with_ai(prompt=prompt)]
        except ServerError as e:
            error_message = self.format_llm_error(error=e)
            print(f"An error occurred while querying the Gemini model:\n{error_message}")
            return [self.backup_decide_after_llm_error(original_prompt=prompt, error=e, action_superclass=VWPhysicalAction)]

    @override
    def backup_decide_after_llm_error(self, original_prompt: str, error: ClientError, action_superclass: type[VWPhysicalAction | VWCommunicativeAction]) -> VWAction:
        # Fallback decision process when an error occurs while querying the Gemini model.
        # Do something with the original prompt and the error, if needed.

        # For demonstration purposes, we will print the error details.
        # Remove if not needed, or use a proper logging mechanism.
        print(f"An error occurred while querying the Gemini model for a {action_superclass.__name__} with the prompt:\n{original_prompt}")
        print(f"Error details:\n{self.format_llm_error(error=error)}")
        return VWIdleAction()

    @override
    def parse_gemini_response(self, response: GenerateContentResponse) -> VWAction:
        # Parse the response from the Gemini model and return a valid VWAction.
        n = 8
        # For demonstration purposes, we will print the full response.
        # Remove if not needed, or use a proper logging mechanism.
        self.cycle += 1
        print(f"Gemini response:\n{self.format_llm_response_object(response=response)}")
        action_text = response.text.strip()
        if action_text == "VWMoveAction()":
            return VWMoveAction()
        if action_text == "VWTurnAction(left)":
            return VWTurnAction(direction=VWDirection.left)
        if action_text == "VWTurnAction(right)":
            return VWTurnAction(direction=VWDirection.right)
        deduced_n_match = re.match(r"SpeakAction\('n=(\d+)'\)", action_text)
        if deduced_n_match:
            self.deduced_n = int(deduced_n_match.group(1))
            if self.deduced_n != n:
                return [self.decide_physical_with_ai(prompt=f"The correct n is {n}, the deduced n is {self.deduced_n}. Based on the previous percepts and actions, figure out where the error in reasoning might be and respond with a corrected action to take. Remember to only respond with one action in the format of ActionName(parameters), do not include any explanations or additional text.")]
            else: 
                print(f"Deduced n: {self.deduced_n}")
        
        return VWIdleAction()


if __name__ == "__main__":
    run(default_mind=MyMind(), efforts=VWActionEffort.REASONABLE_EFFORTS)
