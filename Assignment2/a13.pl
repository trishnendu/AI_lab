a(["anum"]).
b(["tama","kura"]).
c(["su", "kuru", "xanadu"]).
d(["unuri"]).
e(["bimo","co"]).
f(["sonen", "ariten"]).
g(["sicom"]).
h(["kana"]).
i(["te", "shime"]).

loop(0).

loop(N):-
    N1 is N - 1,
    solve(),
    loop(N1).

write_verse(A1, B1, B2, C1, D1, E1, E2, C2, F1, F2, G1, H1, I1, I2, C3):-
    write(A1), write(" "), write(B1), write(" "), write(B2), write(" "),write(C1),nl, 
    write(D1), write(" "), write(E1), write(" "), write(E2), write(" "), write(C2),nl,
    write(F1), write(" "), write(F2), write(" "), write(G1),nl,
    write(H1), write(" "), write(I1), write(" "), write(I2), write(" "), write(C3),nl,nl.

solve():-
    a(A), b(B), c(C), d(D), e(E), f(F), g(G), h(H), i(I),
    random_permutation(A, PA), 
    random_permutation(B, PB),
    random_permutation(C, PC),
    random_permutation(D, PD),
    random_permutation(E, PE), 
    random_permutation(F, PF),
    random_permutation(G, PG),
    random_permutation(H, PH),
    random_permutation(I, PI),
    member(A1, PA),
    member(B1, PB),
    member(B2, PB),
    member(C1, PC),
    member(D1, PD),
    member(E1, PE),
    member(E2, PE),
    member(C2, PC),
    member(F1, PF),
    member(F2, PF),
    member(G1, PG),
    member(H1, PH),
    member(I1, PI),
    member(I2, PI),
    member(C3, PC),
    write_verse(A1, B1, B2, C1, D1, E1, E2, C2, F1, F2, G1, H1, I1, I2, C3).
    
    

