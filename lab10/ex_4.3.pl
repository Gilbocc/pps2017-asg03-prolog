% last([1,2,3],5,[1,2,3,5]).
last([], N, [N]).
last([X|Xs], N, M):- last(Xs, N, T), M = [X|T].

% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).
seqR2(0, [0]).
seqR2(N, X):- N > 0, N2 is N-1, last(Y, N, X), seqR2(N2,Y).