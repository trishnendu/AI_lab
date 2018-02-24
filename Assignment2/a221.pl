% pre order traversal from in order and post order traversal

pre_from_in_post([], [], []).
pre_from_in_post(In, Post, Pre):-
    append(Restpost, [X], Post),
    divide_subtreex(X, In, Leftin, Rightin),
    length(Leftin, N),
    divide_subtreel(N, Restpost, Leftpost, Rightpost),
    pre_from_in_post(Rightin, Rightpost, Rightpre),
    pre_from_in_post(Leftin, Leftpost, Leftpre),
    append([X|Leftpre], Rightpre, Pre).

divide_subtreel(0, L, [], L).
divide_subtreel(N, [X|L], [X|L1], L2):-
    N1 is N - 1,
    divide_subtreel(N1, L, L1, L2).

divide_subtreex(X, [X|L], [], L).
divide_subtreex(X, [Y|L], [Y|L1], L2):-
    divide_subtreex(X, L, L1, L2).
