% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element

max([H|T],A) :- max(T,A,H).
max([],M,TM) :- M is TM.
max([X|Xs],M,TM) :-
    X >= TM,
    max(Xs, M, X).
max([X|Xs],M,TM) :-
    X < TM,
    max(Xs, M, TM).