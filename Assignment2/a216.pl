band_soloist(band(soloist(N1, C1, T1), soloist(N2, C2, T2), soloist(N3, C3, T3))).
first(X, band(X, _, _)).
named(soloist(N, _, _), N).
country(soloist(_, X, _), X).
plays(soloist(_, _, P), P).
ordered_member(X, Y, band(X, Y, _)).
ordered_member(X, Z, band(X, _, Z)).
ordered_member(Y, Z, band(_, Y, Z)).
member1(X, band(X, _, _)).
member1(Y, band(_, Y, _)).
member1(Z, band(_, _, Z)).

musician_solution(S):-
    band_soloist(S),
    first(X1, S), plays(X1, piano),
    ordered_member(X2, Y2, S), named(X2, john), plays(X2, saxophone), country(Y2, australia),
    ordered_member(X3, Y3, S), named(X3, mark), country(X3, us), plays(Y3, violin),
    country(X4, japan), member1(X4, S),
    named(Y4, sam), member1(Y4, S).  