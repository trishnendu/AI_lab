%deletemiddleodd(L, L1)
deletemiddleodd(L, L1):-
    deletemiddleoddhelp(L, L, L1).
deletemiddleoddhelp([X|L], [Y], L).
deletemiddleoddhelp([X|L], [A|[B|H]], [X|L1]):-
    deletemiddleoddhelp(L, H, L1).

%deletemiddleeven(L, L1)
deletemiddleeven(L, L1):-
    deletemiddleevenhelp(L, L, L1).
deletemiddleevenhelp([X|[Y|L]], Tmp, L):-
    length(Tmp, 2),!.
deletemiddleevenhelp([X|L], [A|[B|H]], [X|L1]):-
    deletemiddleevenhelp(L, H, L1).

%customreverse(L, R)
customreverse(L, R):-
    customreversehelp(L, L, [], R).
customreversehelp([X|L], [Y], F, R):-
    reverse(L, R1),
    append(F, [X], F1),
    append(F1, R1, R).
customreversehelp([X|L], [A|[B|H]], F, R):-
    customreversehelp(L, H, [X|F], R).
    