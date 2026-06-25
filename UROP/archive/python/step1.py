import janus_swi as janus

janus.consult("UROP/EC.pl")
janus.query_once("assertz(wallAt(5,2,e))")
janus.query_once("assertz(wallAt(1,2,w))")
janus.query_once("assertz(wallAt(1,5,s))")
janus.query_once("assertz(wallAt(1,1,n))")
result = janus.query_once("find(N)")
print(result)