% size(List,Size)
% Size will contain the number of elements in List, written using notation zero, s(zero), s(s(zero))..

size([],s(0)).
size([_|T],M) :- size(T,N), M = s(N).