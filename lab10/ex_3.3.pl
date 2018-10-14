% search(Elem,List)
search(X,[X|_]).
search(X,[_|Xs]):-search(X,Xs).

% sublist(List1,List2)
% List1 should be a subset of List2
% example: sublist([1,2],[5,3,2,1]).
sublist([], _).
sublist([X|Xs], Y):-
    search(X, Y),
    sublist(Xs, Y).