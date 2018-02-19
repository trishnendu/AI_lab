%splitposneg(L, A, B)
splitposneg([], [], []).
splitposneg([X|L], [X|A], B):-
    X >= 0, !,  splitposneg(L, A, B).
splitposneg([X|L], A, [X|B]):-
    splitposneg(L, A, B).

%countgreater100(L, N)
countgreater100([], 0).
countgreater100([X|A], N):-
    X >= 100, countgreater100(A, N1), N is N1+1;
    countgreater100(A, N).