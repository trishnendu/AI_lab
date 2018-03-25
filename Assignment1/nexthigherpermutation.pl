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
	higher(L2, L1).