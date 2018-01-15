myreverse([], []).
myreverse([X|L], R):-
	myreverse(L, S),
	append(S, [X], R). 
