orderedlist([]).
orderedlist([X]).
orderedlist([X|[Y|L]]):-
    X =< Y, orderedlist([Y|L]).