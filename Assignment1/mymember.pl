mymember(X, [X|L]).
mymember(X, [Y|L]):-
	mymember(X, L). 
