% dropAll: drop all occurrences
% (returning a single list as result)
dropAll(X,[X|T],T):- not(member(X, T)), !.
dropAll(X,[X|Xs],L):- !, dropAll(X,Xs,L).
dropAll(X,[H|Xs],[H|L]):-dropAll(X,Xs,L).

% dropNode(+Graph, +Node, -OutGraph)
% drop all edges starting and leaving from a Node
% use dropAll defined in 1.1
dropNode(G,N,O):- 
    dropAll(G,e(N,_),G2),
    dropAll(G2,e(_,N),O).




