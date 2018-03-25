next_higher_permutation1(L, L1):-
	higher_permutation(L, L1),
	not(far_higher_permutation(L,L1)).
	
higher_permutation(L, L1):-
	permutation(L, L1),
	higher(L1, L).


higher([X1|_], [X2|_]):-
	X1 > X2, !.
higher([X|L1], [X|L2]):-
	higher(L1, L2).
	
far_higher_permutation(L, L1):-
	higher_permutation(L, L2),
	higher(L1, L2).
	
next_higher_permutation2(L, Lnp):-
	reverse(L , Lr),
	first_smaller_than_neighbour(Lr, X),
	split(Lr, L1, X, L2),
	elements_gt(X, L1, Lgt),
	smallest(Lgt, Y),
	split(L1, L11, Y, L12),
	append(L11, [X|L12], L3),
	reverse(L3, L3r),
	append(L3r, [Y|L2], L4),
	reverse(L4, Lnp).

first_smaller_than_neighbour([X], X).
first_smaller_than_neighbour([X|[Y|_]], Y):-
	Y < X,!.
first_smaller_than_neighbour([_|L], Y):-
	first_smaller_than_neighbour(L, Y).

smallest([X], X).
smallest([X|L], X):-
	smallest(L, Y),
	X < Y.
smallest([X|L], Y):-
	smallest(L, Y),
	X >= Y.

elements_gt(_, [], []).
elements_gt(X, [Y| L], [Y|L1]):-
	Y > X, !,
	elements_gt(X, L, L1).
elements_gt(X, [_ | L], L1):-
	elements_gt(X, L, L1).
	
split([X|L], [], X, L).
split([X|L], [X|L1], Y, L2):-
	split(L, L1, Y, L2).