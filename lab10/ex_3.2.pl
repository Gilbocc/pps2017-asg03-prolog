% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).

all_bigger([X], [Y]):- X > Y.
all_bigger([X|Xs], [Y|Ys]):- 
    X > Y,
    all_bigger(Xs, Ys).