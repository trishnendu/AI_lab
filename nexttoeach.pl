nexttoeach(X, Y, [X|[Y|L]]).
nexttoeach(X, Y, [Z|L]):-
	nexttoeach(X, Y, L).
