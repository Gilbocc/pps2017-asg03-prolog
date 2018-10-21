% reaching(+Graph, +Node, -List)

% all the nodes that can be reached in 1 step from Node
% possibly use findall, looking for e(Node,_) combined
% with member(?Elem,?List)

reaching(G, N, L):- 
    findall(A, member(e(N, A), G), L).