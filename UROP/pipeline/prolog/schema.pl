%% VacuumWorld Autoformalization Schema
%% DICE Lab UROP - single agent, dirt and agent, N×N grid, 0-based indexing
%%
%% Coordinate system:
%%   (X, Y) where X = column (east +), Y = row (south +)
%%   (0, 0) = north-west corner
%%
%% LLM fills Sections A and B; Sections C and D are fixed scaffolding.

:- dynamic dirt/3, agent/4, perceived/2,
           grid_size/1, wall/3, empty/2, seen/1, location/2.

:- discontiguous dirt/3, agent/4, wall/3,
                 empty/2, perceived/2, seen/1.


%% ---- Section A: Translation (LLM fills) ------------------------------------
%% Emit ground facts from the deduplicated percept log:
%%   grid_size(N). grid(X,Y). dirt(X,Y, Colour).
%%   agent(Id, X,Y, Colour). empty(X,Y).

%% >>> BEGIN translation facts


%% >>> END translation facts


%% ---- Section B: Wall Rules (LLM fills) -------------------------------------
%% Define wall(X, Y, Dir) for the four boundary directions.
%% Rules must generalise over grid_size(N), not enumerate specific walls.

%% >>> BEGIN wall rules


%% >>> END wall rules