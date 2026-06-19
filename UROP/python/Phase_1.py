#!/usr/bin/env python3
## Phase 1: derive N dimensions using only wall bumps and Prolog EC

from typing import Iterable, override

from vacuumworld import run
from vacuumworld.model.actions.vwactions import VWAction
from vacuumworld.model.actions.vweffort import VWActionEffort
from vacuumworld.model.actor.mind.surrogate.vwactor_mind_surrogate import VWActorMindSurrogate
from vacuumworld.model.actions.vwmove_action import VWMoveAction
from vacuumworld.model.actions.vwturn_action import VWTurnAction
from vacuumworld.common.vwdirection import VWDirection

import janus_swi as janus

janus.consult("UROP/EC.pl")


class MyMind(VWActorMindSurrogate):
    def __init__(self) -> None:
        super().__init__()
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

    def prologPos(self, pos, time, orien):
        x, y = pos
        janus.query_once(f"assertz(initiatesAt(move({orien}), at({x},{y}), {time}))")
        if self.prev_pos is not None and self.prev_pos != pos:
            px, py = self.prev_pos
            janus.query_once(f"assertz(terminatesAt(move({orien}), at({px},{py}), {time}))")
        self.prev_pos = pos

    def prologMove(self, orien, time):
        janus.query_once(f"assertz(happensAt(move({orien}), {time}))")

    def bump(self, direction, pos, time):
        x, y = pos
        janus.query_once(f"bump({direction}, {x}, {y}, {time})")

    @override
    def decide(self) -> Iterable[VWAction]:
        if self.turning > 0:
            self.turning -= 1
            self.cycle += 1
            return [VWTurnAction(direction=VWDirection.right)]

        coordinate = self.get_own_position()
        orien = self.get_own_orientation()
        x, y = coordinate
        time = self.cycle

        self.prologMove(orien, time)

        old_pos = self.prev_pos
        if time > 0:
            self.prologPos(coordinate, time, orien)
        
        if time > 0 and old_pos == coordinate:
            self.turning = 1
            self.prev_pos = None
            self.bump(orien, coordinate, time)

        print(janus.query_once("wallAt(X, Y, D)"))
        print(janus.query_once("findbyHeight(N)"))
        print(janus.query_once("findbyWidth(N)"))
        print(janus.query_once("find(N)"))

        
        self.cycle += 1
        return [VWMoveAction()]


if __name__ == "__main__":
    run(default_mind=MyMind(), efforts=VWActionEffort.REASONABLE_EFFORTS, gui=True)
