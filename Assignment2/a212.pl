%cola(N)
cola(N):-
    N = 1,!,
    write(N), write(' bottle of coke on the wall'), nl,
    write(N), write(' bottle of coke'), nl,
    write('You take one down and pass it around'), nl,
    write('No bottle of coke on the wall.');
    write(N), write(' bottles of coke on the wall'), nl,
    write(N), write(' bottles of coke'), nl,
    write('You take one down and pass it around'), nl,
    N1 is N - 1,
    cola(N1).
    