add(A, 0, A).
add(A, D, E):-
    B is D-1,
    add(A, B, C),
    E is C+1.

subs(A, 0, A).
subs(A, B, C):-
    D is B-1,
    subs(A, D, E),
    C is E-1.

mult(A, 0, 0).
mult(A, B, C):-
    D is B-1,
    mult(A, D, E),
    C is E+A. 

divide(A, B, 0, A):-
    B > A,!.
divide(A, B, C, R):-    
    D is A-B,
    divide(D, B, E, R),
    C is E+1.
    