%Implement predicate next/4 as follows
%– next(@Table,@Player,-Result,-NewTable)
%– Table is a representation of a TTT table where players x
%  or o are playing
%– Player (either x or o) is the player to move
%– Result is either (either win(x), win(o), nothing, or even)
%– NewTable is the table after a valid move
%– Should find a representation for the Table
%– Calling the predicate should give all results
%• Secondarily, implement predicate:
%– game(@Table,@Player,-Result,-TableList)
%– TableList is the sequence of tables until Result win(x),
%  win(o) or even

%– [[_,_,_],[x,o,x],[o,x,_]]: nice but advanced
%– [[n,n,n],[x,o,x],[o,x,n]]: compact, but need work
%– [cell(0,1,x),cell(1,1,o),cell(2,1,x),…]: easier

next(T,P,R,NT):-
    move(T, P, NT),
    getResult(P, NT, R).

move(T, P, NT):-
    member(cell(A, B, void), T),
    replace(T, cell(A,B,void), cell(A,B,P), NT).

replace([H|T], OE, NE, NT):- 
    H == OE,
    NT = [NE|T].

replace([H|T], OE, NE, [H|TT]):-
    replace(T, OE, NE, TT).

getResult(P, NT, R):- checkColumns(P, NT), !, R = win(P).
getResult(P, NT, R):- checkRows(P, NT), !, R = win(P).
getResult(P, NT, R):- checkDiags(P, NT), !, R = win(P).
getResult(P, NT, R):- checkEven(P, NT), !, R = even.
getResult(_, _, R):- R = nothing.

checkRows(P, NT):- member(cell(0, 0, P), NT), member(cell(0, 1, P), NT), member(cell(0, 2, P), NT).
checkRows(P, NT):- member(cell(1, 0, P), NT), member(cell(1, 1, P), NT), member(cell(1, 2, P), NT).
checkRows(P, NT):- member(cell(2, 0, P), NT), member(cell(2, 1, P), NT), member(cell(2, 2, P), NT).
checkColumns(P, NT):- member(cell(0, 0, P), NT), member(cell(1, 0, P), NT), member(cell(2, 0, P), NT).
checkColumns(P, NT):- member(cell(0, 1, P), NT), member(cell(1, 1, P), NT), member(cell(2, 1, P), NT).
checkColumns(P, NT):- member(cell(0, 2, P), NT), member(cell(1, 2, P), NT), member(cell(2, 2, P), NT).
checkDiags(P, NT):- member(cell(0, 0, P), NT), member(cell(1, 1, P), NT), member(cell(2, 2, P), NT).
checkDiags(P, NT):- member(cell(2, 0, P), NT), member(cell(1, 1, P), NT), member(cell(0, 2, P), NT).
checkEven(_, NT):- not(member(cell(_,_,void), NT)). 

% next([cell(0,0,void),cell(0,1,void),cell(0,2,void),cell(1,0,void),cell(1,1,void),cell(1,2,void),cell(2,0,void),cell(2,1,void),cell(2,2,void)], x, R, NT).

game(T, P, R, TL):- game(T, P, R, nothing, TL, [T]).
game(_, _, R, RR, TL, TLL):-
    RR \= nothing,
    R = RR,
    TL = TLL.
game(T, P, R, _, TL, TLL):-
    P == x,
    next(T, P, R1, TT), 
    append(TLL, [TT], RES),
    game(TT, o, R, R1, TL, RES).
game(T, P, R, _, TL, TLL):-
    next(T, P, R1, TT), 
    append(TLL, [TT], RES),
    game(TT, x, R, R1, TL, RES).

% game([cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void),cell(0,0,void)], x, win(x), NT).