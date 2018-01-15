mylength([], 0).
mylength([X|L], s(M)):-
	mylength(L, M).
