% dropAny(?Elem,?List,?OutList)
dropAny(X,[X|T],T).
dropAny(X,[H|Xs],[H|L]):-dropAny(X,Xs,L).


% dropFirst: drops only the first occurrence 
% (showing no alternative results)
dropFirst(X,[X|T],T):-!.
dropFirst(X,[H|Xs],[H|L]):-dropFirst(X,Xs,L).


% dropLast: drops only the last occurrence 
% (showing no alternative results)
% search(Elem,List)
dropLast(X,[X|T],T):- not(member(X, T)), !.
dropLast(X,[H|Xs],[H|L]):-dropLast(X,Xs,L).


% dropAll: drop all occurrences
% (returning a single list as result)
dropAll(X,[X|T],T):- not(member(X, T)), !.
dropAll(X,[X|Xs],L):- !, dropAll(X,Xs,L).
dropAll(X,[H|Xs],[H|L]):-dropAll(X,Xs,L).