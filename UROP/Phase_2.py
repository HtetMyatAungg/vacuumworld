#!/usr/bin/env python3
## Phase 2: LLM autoformalizes raw percepts into EC Prolog facts; navigation and EC.pl rules are unchanged from Phase 1.

from typing import Iterable, override

from vacuumworld import run
from vacuumworld.model.actions.vwactions import VWAction
from vacuumworld.model.actions.vweffort import VWActionEffort
from vacuumworld.model.actions.vwmove_action import VWMoveAction
from vacuumworld.model.actions.vwturn_action import VWTurnAction
from vacuumworld.common.vwdirection import VWDirection
from vacuumworld.model.actions.vwactions import VWPhysicalAction, VWCommunicativeAction
from vacuumworld.model.actor.mind.surrogate.vw_llm_actor_mind_surrogate import VWLLMActorMindSurrogate

from google.genai.errors import ClientError
import re

import janus_swi as janus

janus.consult("UROP/EC.pl")

ASSERTZ_RE = re.compile(r"^assertz\([a-zA-Z_]+\(.*\)\)\.?$")

EC_CONVENTION = (
    "You are autoformalizing a single VacuumWorld simulation cycle into Event Calculus Prolog facts. "
    "Convention: Event-Fluent-Time. Predicates available: initially(F,0). happensAt(E,T). "
    "initiatesAt(E,F,T). terminatesAt(E,F,T). Fluents are at(X,Y) and orient(D). Events are move(D). "
    "Respond with exactly one assertz(...) line per fact needed, one per line, no explanations, no markdown."
)


class MyMind(VWLLMActorMindSurrogate):
    def __init__(self) -> None:
        super(MyMind, self).__init__(dot_env_path=".env")
        self.prev_pos = None
        self.cycle = 0
        self.turning = 0

    @override
    def revise(self) -> None:
        coordinate = self.get_own_position()
        time = self.cycle
        orien = self.get_own_orientation()
        if time == 0:
            self.initial(coordinate, orien)

    def initial(self, pos, orien):
        x, y = pos
        janus.query_once(f"assertz(initially(at({x}, {y}),0))")
        janus.query_once(f"assertz(initially(orient({orien}),0))")
        self.prev_pos = pos

    def autoformalize(self, pos, orien, time, bumped):
        x, y = pos
        px, py = self.prev_pos if self.prev_pos is not None else pos
        prompt = (
            EC_CONVENTION
            + f"\nCycle: the agent attempted move({orien}) at time {time}. "
            + f"Position before: at({px},{py}). Position after: at({x},{y}). "
            + ("The move failed (bump, position unchanged). " if bumped else "The move succeeded. ")
        )

        response, error = self.provide_context(context=prompt)
        if error.is_present():
            print(f"LLM error during autoformalization, no fact asserted:\n{error.or_else_raise()}")
            return

        lines = [line.strip() for line in response.or_else_raise().text.strip().splitlines() if line.strip()]
        if not lines or not all(ASSERTZ_RE.match(line) for line in lines):
            print(f"Malformed autoformalization output, no fact asserted:\n{lines}")
            return

        for line in lines:
            result = janus.query_once(line.rstrip("."))
            if result is None or result.get("truth") is False:
                print(f"Autoformalized fact failed to assert: {line}")
                return

    @override
    def decide(self) -> Iterable[VWAction]:
        if self.turning > 0:
            self.turning -= 1
            self.cycle += 1
            return [VWTurnAction(direction=VWDirection.right)]

        coordinate = self.get_own_position()
        orien = self.get_own_orientation()
        time = self.cycle

        old_pos = self.prev_pos
        bumped = time > 0 and old_pos == coordinate

        self.autoformalize(coordinate, orien, time, bumped)
        self.prev_pos = None if bumped else coordinate

        if bumped:
            self.turning = 1
            janus.query_once(f"bump({orien}, {coordinate[0]}, {coordinate[1]}, {time})")

        print(janus.query_once("find(N)"))

        self.cycle += 1
        return [VWMoveAction()]

    @override
    def backup_decide_after_llm_error(self, original_prompt: str, error: ClientError, action_superclass: type[VWPhysicalAction | VWCommunicativeAction]) -> VWAction:
        print(f"LLM error:\n{self.format_llm_error(error=error)}")
        return VWMoveAction()

    @override
    def parse_gemini_response(self, response):
        return VWMoveAction()


if __name__ == "__main__":
    run(default_mind=MyMind(), efforts=VWActionEffort.REASONABLE_EFFORTS, gui=True)
