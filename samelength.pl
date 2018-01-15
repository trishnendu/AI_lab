samelength([], []).
samelength([X|L], [Y|R]):-
	samelength(L, R).
