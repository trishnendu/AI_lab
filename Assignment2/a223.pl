% arc rearranging
rearrange_arc([X], [X]).
rearrange_arc(X, [arc(A, B)| [arc(B, C) | Y]]):-
    remove(X, arc(A, B), X1),
    rearrange_arc(X1, [arc(B, C)| Y]).

remove([X|L], X, L).
remove([Y|L], X, [Y|L1]):-
    remove(L, X, L1).

rearrange_cycle(X, Y):-
    rearrange_arc(X, Y),
    check_cycle(Y).

check_cycle([arc(A, _)|Y]):-
    append(_, [arc(_, A)], Y).
