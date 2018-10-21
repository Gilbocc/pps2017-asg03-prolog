% allreaching(+Graph, +Node, -List)
% all the nodes that can be reached from Node
% Suppose the graph is NOT circular!
% Use findall and anyPath!

reaching(G, N, L):- 
    findall(A, member(e(N, A), G), L).

anypath(G, N1, N2, L):- 
    member(e(N1, N2), G),
    L = [e(N1, N2)].
anypath(G, N1, N2, [e(N1,E)|LL]):-
    reaching(G, N1, O),
    member(E, O),
    anypath(G, E, N2, LL).

allreaching(G, N, L):-
    findall(A, anypath(G, N, A, _), L).