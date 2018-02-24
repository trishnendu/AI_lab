% plus (s(s(0)), s(s(s(0))), X))

plus(X, 0, X).
plus(X, s(Y), s(S)):-
    plus(X, Y, S).

subs(X, 0, X).
subs(0, X, _):-
    display('substraction is not possible!').
subs(s(X), s(Y), S):-
    subs(X, Y, S).

multi(_, 0, 0).
multi(0, _, 0).
multi(X, s(0), X).
multi(X, s(Y), M):-
    multi(X, Y, M1),
    plus(X, M1, M).

less_than(0, s(X)).
less_than(s(X), s(Y)):-
    less_than(X, Y).

absolute_value(0, 0).
absolute_value(s(X), N):-
    absolute_value(X, N1),
    N is N1 + 1.

square_root(X, Y):-
    sqr_acc(X, 0, Y).

sqr_acc(X, A, A):-
    multi(A, A, X).

sqr_acc(X, A, Y):-
    multi(A, A, M),
    less_than(M, X),!,
    sqr_acc(X, s(A), Y).

div(_, 0, _, _):-
    display('division by zero').
div(0, _, 0, 0).
div(X, Y, 0, X):-
    less_than(X, Y).
div(X, Y, s(D), R):-
    subs(X, Y, X1),
    div(X1, Y, D, R).