%binary tree
binary_tree(nil).
binary_tree(bt(Left, _, Right)):-
    binary_tree(Left),
    binary_tree(Right).

preorder(nil, []).
preorder(bt(Left, Root, Right), L):-
    preorder(Left, L1),
    preorder(Right, L2),
    append([Root], L1, LRo),
    append(LRo, L2, L).

inorder(nil, []).
inorder(bt(Left, Root, Right), L):-
    inorder(Left, L1),
    inorder(Right, L2),
    append(L1, [Root], LR),
    append(LR, L2, L).

postorder(nil, []).
postorder(bt(Left, Root, Right), L):-
    postorder(Left, L1),
    postorder(Right, L2),
    append(L1, L2, LR),
    append(LR, [Root], L).

postgivenprein(Lpre, Lin, Lpost):-
    preorder(Bt, Lpre),
    inorder(Bt, Lin),
    postorder(Bt, Lpost).