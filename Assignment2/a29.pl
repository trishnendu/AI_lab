%sum1(L, S)
sum1([], 0).
sum1([X|L], S):-
    sum1(L, S1),
    S is S1 + X.

%length1(L, N)
length1([], 0).
length1([X|L], N):-
    length1(L, N1),
    N is N1 + 1.

%mean1(L, X)
mean1([], M):-
    display('No element in list, Mean is not defined for empty list').
mean1(L, M):-
    sum1(L, S),
    length1(L, N),
    M is S / N.

%mean2(L, X)
mean2([], M):-
    display('No element in list, Mean is not defined for empty list').
mean2(L, M):-
    meanacc(L, 0, 0, M).
meanacc([], S, N, M):-
    M is S / N.
meanacc([X|L], S, N, Y):-
    S1 is S + X,
    N1 is N + 1,
    meanacc(L, S1, N1, Y).


