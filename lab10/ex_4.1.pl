% seq(N,List)
% example: seq(5,[0,0,0,0,0]).
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).