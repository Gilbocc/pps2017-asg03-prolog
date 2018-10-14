% sum(List,Sum)
sum([],0).
sum([H|T],M) :- sum(T,N), M is H+N.