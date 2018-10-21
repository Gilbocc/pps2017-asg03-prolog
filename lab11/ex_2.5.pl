% anypath(+Graph, +Node1, +Node2, -ListPath)
% a path from Node1 to Node2
% if there are many path, they are showed 1-by-1

reaching(G, N, L):- 
    findall(A, member(e(N, A), G), L).

anypath(G, N1, N2, L):- 
    member(e(N1, N2), G),
    L = [e(N1, N2)].
anypath(G, N1, N2, [e(N1,E)|LL]):-
    reaching(G, N1, O),
    member(E, O),
    anypath(G, E, N2, LL).
