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


def _name(x):
    return str(x).split(".")[-1].lower()


class MyMind(VWActorMindSurrogate):
    def __init__(self) -> None:
        super(MyMind, self).__init__()
        self.state = "sweep"
        self.turn_dir = VWDirection.right
        self.percepts = []
        self.last_action = None

    @override
    def revise(self) -> None:
        obs = self.get_latest_observation()
        pos = self.get_own_position()
        heading = _name(self.get_own_orientation())

        slots = ["forwardleft", "forward", "forwardright", "left", "center", "right"]
        getters = {
            "forwardleft":  obs.get_forwardleft,
            "forward":      obs.get_forward,
            "forwardright": obs.get_forwardright,
            "left":         obs.get_left,
            "center":       obs.get_center,
            "right":        obs.get_right,
        }

        def cell_info(opt):
            if opt.is_empty():
                return None
            loc = opt.or_else_raise()
            cd = loc.get_coord()
            walls = sorted(_name(k) for k, v in loc.get_wall_info().items() if v)
            dirt = _name(loc.get_dirt_appearance().or_else_raise().get_colour()) if loc.has_dirt() else None
            agent = None
            if loc.has_actor():
                a = loc.get_actor_appearance().or_else_raise()
                if _name(a.get_colour()) != "white":
                    agent = {"id": a.get_id(), "colour": _name(a.get_colour())}
            return {"coord": [cd.get_x(), cd.get_y()], "walls": walls, "dirt": dirt, "agent": agent}

        self.percepts.append({
            "cycle": len(self.percepts),
            "action": self.last_action,
            "pose": {"x": pos[0], "y": pos[1], "orientation": heading},
            "grid": {s: cell_info(getters[s]()) for s in slots},
        })

        with open("UROP/Percepts/event_percepts.json", "w") as f:
            json.dump(self.percepts, f, indent=2)

    @override
    def decide(self) -> Iterable[VWAction]:
        obs = self.get_latest_observation()

        if self.state == "sweep":
            if obs.is_wall_one_step_ahead():
                self.state = "turn1"
                self.last_action = "turn_" + _name(self.turn_dir)
                return [VWTurnAction(direction=self.turn_dir)]
            self.last_action = "move"
            return [VWMoveAction()]

        if self.state == "turn1":
            if obs.is_wall_one_step_ahead():
                self.state = "done"
                self.last_action = "turn_" + _name(self.turn_dir)
                return [VWTurnAction(direction=self.turn_dir)]
            self.state = "shift"
            self.last_action = "move"
            return [VWMoveAction()]

        if self.state == "shift":
            turn = self.turn_dir
            self.turn_dir = VWDirection.left if self.turn_dir == VWDirection.right else VWDirection.right
            self.state = "sweep"
            self.last_action = "turn_" + _name(turn)
            return [VWTurnAction(direction=turn)]

        self.last_action = "turn_right"
        return [VWTurnAction(direction=VWDirection.right)]


if __name__ == "__main__":
    run(white_mind=MyMind(), green_mind=VWHystereticMindSurrogate(), orange_mind=VWHystereticMindSurrogate(), efforts=VWActionEffort.REASONABLE_EFFORTS, gui=True)