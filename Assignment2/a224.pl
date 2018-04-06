atp(L):-
	member([], L),!.
atp(L):-	
	member(L1, L),
	remove(L1, L, Rest),
	member(L2, Rest),
	member(A, L1),
	invert(A, Anot),
	member(Anot, L2), 
	remove(A, L1, L1new),
	remove(Anot, L2, L2new),
	append(L1new, L2new, L3),
	not(member(L3, L)),!,
	atp([L3 | L]).
	
remove(X, [X|L], L).
remove(X, [Y|L], [Y|L1]):-
	remove(X, L, L1).
	
invert(not-A, A).
invert(A, not-A).
