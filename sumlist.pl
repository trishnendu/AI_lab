sumlist([], 0).
sumlist([X|L], S):-
	sumlist(L, T),
S is X + T.
