% fromCircList(+List,-Graph)
fromCircList(X, Y):-fromCircList(X, X, Y).
fromCircList([X|_],[L],[e(L,X)]).
fromCircList(X,[H1,H2|T],[e(H1,H2)|L]):- fromCircList(X,[H2|T],L).