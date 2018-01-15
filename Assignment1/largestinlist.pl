include(mymax).
largestinlist([X], X).
largestinlist([X|L], M):-
    largestinlist(L, Z),
    mymax(X, Z, M).
    