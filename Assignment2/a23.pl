%replacefirstoccur(X, Y, L, L1)
replacefirstoccur(_, _, [], []).
replacefirstoccur(X, Y, [X|L], [Y|L]).
replacefirstoccur(X, Y, [H|L], [H|L1]):-
    replacefirstoccur(X, Y, L, L1).

%delnthele(L, N, L1)
delnthele([], _, []).
delnthele([X|L], 1, L).
delnthele([X|L], N, [X|L1]):-
    N1 is N-1,
    delnthele(L, N1, L1).
    
%replacenthele(L, N, Y, L1)
replacenthele([], _, _, []).
replacenthele([X|L], 1, Y, [Y|L]).
replacenthele([X|L], N, Y, [X|L1]):-
    N1 is N-1,
    replacenthele(L, N1, Y, L1).
    