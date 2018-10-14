% average(List,Average)
% it uses average(List,Count,Sum,Average)

average(List,A) :- average(List,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :-
C2 is C+1,
S2 is S+X,
average(Xs,C2,S2,A).