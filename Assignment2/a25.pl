%double(List, ListList)
double([], _).    
double([X|L], L1):-
    count(X, L1, N),
    N >= 2,
    double(L, L1).

count(_, [], 0).
count(X, [X|L], N):-
    count(X, L, N1),
    N is N1 + 1.
count(X, [Y|L], N):-
    count(X, L, N).