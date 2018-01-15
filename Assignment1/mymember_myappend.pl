include(myappend).
mymember(X, L):-
	myappend(F, [X|R], L).
