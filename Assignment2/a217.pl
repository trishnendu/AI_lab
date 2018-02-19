%ackerman(M, N, A)
ackerman(0, N, A):-
    A is N + 1.
ackerman(M, 0, A):-
    M1 is M - 1,
    ackerman(M1, 1, A).
ackerman(M, N, A):-
    M1 is M - 1,
    N1 is N - 1,
    ackerman(M, N1, B),
    ackerman(M1, B, A).
