move(N, F, T, A):-
    write('Moving disk '), write(N), write(' from '), write(F), write(' to '), write(T), write(' using '), write(A), nl.

tower(1, F, T, A):- move(1, F, T, A).
tower(N, F, T, A):-
    N1 is N - 1,
    tower(N1, F, A, T),
    move(N, F, T, A),
    tower(N1, A, T, F).
