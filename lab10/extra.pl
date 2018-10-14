% inv(List,List)
% example: inv([1,2,3],[3,2,1]).
inv(X, M):-inv(X, M, []).
inv([], X, X).
inv([H|T], Z, R):- 
	inv(T, Z, [H|R]).

% double(List,List)
% suggestion: remember predicate append/3
% example: double([1,2,3],[1,2,3,1,2,3]).
double(X, Y):- append(X, X, Y).

% times(List,N,List)
% example: times([1,2,3],3,[1,2,3,1,2,3,1,2,3]).
times(X, N, Y):- times(X, [], N, Y).
times(_, X, 0, X).
times(X, R, N, Y):-
    N > 0,
    N2 is N-1,
    append(R, X, T),
    times(X, T, N2, Y).

% proj(List,List)
% example: proj([[1,2],[3,4],[5,6]],[1,3,5]).
proj(X, Y):-proj(X, [], Y).
proj([], X, X).
proj([[H|_]|T], R, Y):- 
    append(R, [H], M), 
    proj(T, M, Y).