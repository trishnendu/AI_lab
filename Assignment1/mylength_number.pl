mylength_number([], 0).
mylength_number([X|L], M):-
    mylength_number(L, N),
    M is N + 1.