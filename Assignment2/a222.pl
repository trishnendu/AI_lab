% binary search tree

% insert
insert(X, nil, bst(nil, X, nil)).
insert(X, bst(Left, Root, Right), bst(Left1, Root, Right)):-
    X =< Root, !,
    insert(X, Left, Left1).
insert(X, bst(Left, Root, Right), bst(Left, Root, Right1)):-
    insert(X, Right, Right1).

% find minimum
find_minimum(bst(nil, X, nil), X).
find_minimum(bst(Left, Root, Right), X):-
    find_minimum(Left, X).

% delete leaf node
del_leaf(X, bst(nil, X, nil), nil).
del_leaf(X, bst(Left, Root, Right), bst(Left1, Root, Right)):-
    del_leaf(X, Left, Left1).
del_leaf(X, bst(Left, Root, Right), bst(Left, Root, Right1)):-
    del_leaf(X, Right, Right1).

% Linearize binary tree
linearize_bt(nil, []).
linearize_bt(bst(Left, Root, Right), L):-
    linearize_bt(Left, L1),
    linearize_bt(Right, L2),
    append(L1, [Root|L2], L).

% tree sort
tree_sort(L, S):-
    build_bst(L, BST),
    linearize_bt(BST, S).

build_bst([], nil).
build_bst([X|L], BST):-
    build_bst(L, BST1),
    insert(X, BST1, BST).