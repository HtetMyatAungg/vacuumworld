grid(
    N=8,
    rows([
        [0, 1], [], [], [], [], [], [], [],
        [1, _5FBB17A0-D2DD-461D-BCE4-4FFC2EBAFAAD, null], 
        [2, _4E8ED3F9-6FF7-4A80-B57C-AEE3AFD5772B, 0.5], [], [], [], []
    ]),
    walls([
        [],
        [_06CDCA17E-480D-4EE1-B8C2-D1DA0FB0DF1B, "west"],
        [], 
        [_6EDF2B38-E95C-4A6A-A0BB-CBB3D1807AC3, "south"], [_EADB5C7F-0FBA-4BCB-98DC-D24DA081AEDA, "north"],
        [], 
        [_DAFFEBAA902-EAD8-406B-BB1D-DFE9E37E4A5C, "east"]
    ]),
    dirt([
        [],
        [_EDF2B38-E95C-4A6A-A0BB-CBB3D1807AC3, 0.5],
        [], 
        [_EADB5C7F-0FBA-4BCB-98DC-D24DA081AEDA, "green"], [],
        [_DAFFEBAA902-EAD8-406B-BB1D-DFE9E37E4A5C, null], [_1AE3AFD5772B-FDFA-40FD-AFBF-DD1AEE21BA2D, "orange"]
    ]),
    agents([
        [],
        [], 
        [_DAFFEBAA902-EAD8-406B-BB1D-DFE9E37E4A5C, 0], 
        [_1AE3AFD5772B-FDFA-40FD-AFBF-DD1AEE21BA2D, "orange"], 
        [], [],
        [_FD268D0F-BFFD-442F-85D9-BC8AA1C8D3A9, 0], [],
        [_6EDF2B38-E95C-4A6A-A0BB-CBB3D1807AC3, "green"]
    ])
).

validWalk([], []).
validWalk([[W1|Ws],[W2]], [walk(N=[N1|T], W=W1); walk([N1,W2], T)]++Ws :- validWalk(T)).
validWalk(Ws,T) :- notWalkWolds([]), T=[].

boundary([]) --> [].
boundary([[K]|L]) :- boundary(L), boundary_walk(K).
validWalk([walk(N=[N1|T], W=W1)|T],[[W1,N1|Ta]] :- validWalk(Ta,T)).

validWalk([[W1|Ws]],[walk(N=[N1], W=W1)]++Ws) :- notWalkWolds([]), T=[].

validate_dirts([], _ ).
validate_dirts( [[D1]|[Ds]], grid(G=N, dirt=Ds) ),
    validate_walk(Ws),
    validate_agents(Ags,[agent(C,A),walk(N=[N1] | T)] :- validAgent(Ta,T)).

validWalk([walk(N,K)|L], [K,N|Ts] :- notWalkWolds([]), T=[]).

validate_agents([], _ ).
agent_in_agent(agent(_C,[A|Ta]),[A,C|Ag]),
    valid_walk(Ta,T),
    agent_in_agent2(T,Ag).
    
agent_in_agent([(N1,V)|Ta],[[C=[]], Walk]),
agent_in_agmenter(Ta,T), agent_in_agent(((N1,N2,C)|Ta))), [[C,Ag,Walk]].
agent_in_agent({A=[(N1,V)]}, [[], Ag|T]), N1==N1,C=N, walk(A)] :- T. 

valid_walk([walk(N,K)|L], [K,N|Ts] :- notWalkWolds([]), T=[]).

agent_in_agent(agent(_C,[A|Ta]),[A,C|Ag]),
    valid_walk(Ta,T),
    agent_in_agent2(T,Ag).
    
agent_in_agent([(N1,V)|Ta],[[C=[]], Walk]) :-
    N1==N1, C=N, walk(A), T.

boundary_walk(Wl, Walks) :- boundary_walk(W), validate_wallows([W]).
validate_wallows([]) --> [].
validate_wallows([[W|Ws]]) :- validate_wallows([W]).