## This python file is used to gather percepts from a 3x2 grid around the agent.

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

class MyMind(VWActorMindSurrogate):
    def __init__(self) -> None:
        super(MyMind, self).__init__()
        self.__intended_turn: VWDirection | None = None
        self.cycle = 0
        self.beforeorient = "none"

    def percepts(self, turned_left, turned_right):
        cur_orient = self.get_own_orientation()
        coord = self.get_own_position()
        x, y = coord
        obs = self.get_latest_observation()
        left = obs.get_left()
        left_coord = (x - 1, y)
        right = obs.get_right()
        right_coord = (x + 1, y)
        front = obs.get_forward()
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
        print(percept)
        self.beforeorient = cur_orient

    @override
    def revise(self) -> None:
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
        self.percepts(turned_left,turned_right)   
        

    @override
    def decide(self) -> Iterable[VWAction]:
        self.__intended_turn = VWDirection.right
        obs = self.get_latest_observation()
        self.cycle += 1
        wall_ahead = obs.is_wall_one_step_ahead()
        if wall_ahead:
            return [VWTurnAction(direction=VWDirection.right)]
        return [VWMoveAction()]

if __name__ == "__main__":
    run(default_mind=MyMind(), efforts=VWActionEffort.REASONABLE_EFFORTS)
