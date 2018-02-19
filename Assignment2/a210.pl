%alternate(L1, L2, L)
alternate(X, [], X).
alternate([], X, X).
alternate([X|L1], [Y|L2], [X|[Y|L]]):-
    alternate(L1, L2, L).

%transpose(L1, L2, L)
transpose(L1, L2, L):-
    length(L1, N1),
    length(L2, N2),
    N1 \= N2,
    display('List must be of same length'),!.
transpose([X|L1], [Y|L2], [(X, Y)|L]):-
    transpose(L1, L2, L).
transpose([], [], []).

%innerproduct(L1, L2, V)
innerproduct(L1, L2, V):-
    length(L1, N1),
    length(L2, N2),
    N1 \= N2,
    display('List must be of same length'),!.
innerproduct([X|L1], [Y|L2], V):-
    innerproduct(L1, L2, V1),
    V is V1 + X*Y.
innerproduct([], [], 0).  