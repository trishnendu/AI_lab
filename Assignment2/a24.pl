%cutlast(L, L1)
cutlast([], []).
cutlast([X], []).
cutlast([H|L], [H|L1]):-
    cutlast(L, L1).

%trim(N, L1, L2)
trim(_, [], []).
trim(0, L, L).
trim(N, [H|L], L1):-
    N1 is N-1,
    trim(N1, L, L1).

%trimlast(N, L, L1)
trimlast(_, [], []).
trimlast(N, [X|L], [X|L1]):-
    length(L, N1),
    N =< N1, !,
    trimlast(N, L, L1).
trimlast(N, L, []).
