% search_two(Elem,List)
% looks for two occurrences of Elem with an element in between!

search_two(X,[X,_,X|_]).
search_two(X,[_|Xs]):-search_two(X,Xs).
