% search(Elem,List)
search(X,[X|_]).
search(X,[_|Xs]):-search(X,Xs).

% search_anytwo(Elem,List)
% looks for any Elem that occurs two times
search_anytwo(X,[X|T]):-search(X,T).
search_anytwo(X,[_|Xs]):-search_anytwo(X,Xs).

