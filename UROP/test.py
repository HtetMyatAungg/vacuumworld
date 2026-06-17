#!/usr/bin/env python3

from typing import Iterable, override

from vacuumworld import run
from vacuumworld.model.actions.vwactions import VWAction
from vacuumworld.model.actions.vweffort import VWActionEffort
from vacuumworld.model.actor.mind.surrogate.vwactor_mind_surrogate import VWActorMindSurrogate
from vacuumworld.model.actions.vwmove_action import VWMoveAction
from vacuumworld.model.actions.vwturn_action import VWTurnAction
from vacuumworld.common.vwdirection import VWDirection
from vacuumworld.model.actor.mind.surrogate.vwhysteretic_mind_surrogate import VWHystereticMindSurrogate

import json


# compass -> egocentric label, keyed by the agent's current heading.
# Verify against VW's turn convention: turning right from north should face east.
_COMPASS_TO_EGO = {
    "north": {"north": "forward", "east": "right",   "south": "back",    "west": "left"},
    "east":  {"north": "left",    "east": "forward", "south": "right",   "west": "back"},
    "south": {"north": "back",    "east": "left",    "south": "forward", "west": "right"},
    "west":  {"north": "right",   "east": "back",    "south": "left",    "west": "forward"},
}


def _name(x):
    # handles both "north" and "VWOrientation.north"-style reprs
    return str(x).split(".")[-1].lower()


class MyMind(VWActorMindSurrogate):
    def __init__(self) -> None:
        super().__init__()
        self.n = self.
        self.cycle = 0
        self.ego_history = []      # MODEL-FACING: egocentric, no global coords, no pose
        self.truth_history = []    # HARNESS-ONLY: pose + global coords + compass walls
        self.actions = []          # actions[i] == action taken AFTER ego_history[i]

    @override
    def revise(self) -> None:
        osv = self.get_latest_observation()
        heading = _name(self.get_own_orientation())
        pos = self.get_own_position()
        c2e = _COMPASS_TO_EGO[heading]

        slots = ["forwardleft", "forward", "forwardright", "left", "center", "right"]
        getters = {
            "forwardleft":  osv.get_forwardleft,
            "forward":      osv.get_forward,
            "forwardright": osv.get_forwardright,
            "left":         osv.get_left,
            "center":       osv.get_center,
            "right":        osv.get_right,
        }

        def cell_ego(opt):
            if opt.is_empty():
                return None
            loc = opt.or_else_raise()
            walls = sorted(c2e[_name(k)] for k, v in loc.get_wall_info().items() if v)
            dirt = _name(loc.get_dirt_appearance().or_else_raise().get_colour()) if loc.has_dirt() else None
            return {"walls": walls, "dirt": dirt}          # NO coord — slot name is the position

        def cell_truth(opt):
            if opt.is_empty():
                return None
            loc = opt.or_else_raise()
            cd = loc.get_coord()
            walls = sorted(_name(k) for k, v in loc.get_wall_info().items() if v)
            dirt = _name(loc.get_dirt_appearance().or_else_raise().get_colour()) if loc.has_dirt() else None
            return {"coord": [cd.get_x(), cd.get_y()], "walls": walls, "dirt": dirt}

        self.ego_history.append({s: cell_ego(getters[s]()) for s in slots})
        self.truth_history.append({
            "pose": {"x": pos[0], "y": pos[1], "orientation": heading},
            "cells": {s: cell_truth(getters[s]()) for s in slots},
        })

        # written every cycle so a killed run still keeps data; move to a final
        # write if I/O matters once you scale to many grids
        with open("UROP/percepts_egocentric2.json", "w") as f:
            json.dump({"percepts": self.ego_history, "actions": self.actions}, f, indent=2)
        with open("UROP/ground_truth.json", "w") as f:
            json.dump(self.truth_history, f, indent=2)

    @override
    def decide(self) -> Iterable[VWAction]:
        self.cycle += 1
        osv = self.get_latest_observation()
        if osv.is_wall_one_step_ahead():
            self.actions.append("turn_right")
            return [VWTurnAction(direction=VWDirection.right)]
        self.actions.append("move_forward")
        return [VWMoveAction()]


if __name__ == "__main__":
    run(white_mind=MyMind(), green_mind=VWHystereticMindSurrogate(), orange_mind=VWHystereticMindSurrogate(), efforts=VWActionEffort.REASONABLE_EFFORTS, gui=True)