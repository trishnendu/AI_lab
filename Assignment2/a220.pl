% post order traversal from in order and pre order traversal

post_from_pre_in([], [], []).
post_from_pre_in([X|Pre], In, Post):-
    divide_subtreex(X, In, Leftin, Rightin),
    length(Leftin, L),
    divide_subtreel(L, Pre, Leftpre, Rightpre),
    post_from_pre_in(Rightpre, Rightin, Rightpost),
    post_from_pre_in(Leftpre, Leftin, Leftpost),
    append(Leftpost, Rightpost, T),
    append(T, [X], Post).

divide_subtreel(0, L, [], L).
divide_subtreel(N, [X|L], [X|L1], L2):-
    N1 is N - 1,
    divide_subtreel(N1, L, L1, L2).

divide_subtreex(X, [X|L], [], L).
divide_subtreex(X, [Y|L], [Y|L1], L2):-
    divide_subtreex(X, L, L1, L2).
