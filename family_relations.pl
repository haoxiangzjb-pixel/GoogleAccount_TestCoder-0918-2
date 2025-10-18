% 定义父子/父女关系的基本事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义男性和女性的基本事实
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% 定义祖父关系：X是Z的祖父，如果X是Y的父亲且Y是Z的父母
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系：X是Z的祖母，如果X是Y的母亲且Y是Z的父母
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父或祖母关系（统称祖父母）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义孙子/孙女关系：Z是X的孙子/孙女，如果X是Z的祖父母
grandchild(Z, X) :-
    grandparent(X, Z).

% 定义孙子关系：Z是X的孙子，如果X是Z的祖父且Z是男性
grandson(Z, X) :-
    grandfather(X, Z),
    male(Z).

% 定义孙女关系：Z是X的孙女，如果X是Z的祖母且Z是女性
granddaughter(Z, X) :-
    grandmother(X, Z),
    female(Z).