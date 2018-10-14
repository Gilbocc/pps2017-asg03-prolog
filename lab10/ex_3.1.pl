% same(List1,List2)
% are the two lists the same?
same([],[]).
same([X|Xs],[X|Ys]):- same(Xs,Ys).