last_element([X], X).
last_element([X|L], Y):-
	last_element(L, Y).
