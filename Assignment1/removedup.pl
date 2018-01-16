include(setmember).
removedup(L, X):-
    removedupacc(L, [], X).
removedupacc([], L, L).
removedupacc([X|L], A, Y):-
    setmember(X, A),
    !,
    removedupacc(L, A, Y).
removedupacc([X|L], A, Y):-
    removedupacc(L, [X|A], Y).