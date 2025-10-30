% 定义基本的父子关系
parent(john, mary).
parent(john, david).
parent(mary, lisa).
parent(mary, paul).
parent(david, ann).
parent(susan, tom).
parent(tom, emma).
parent(emma, alice).
parent(alice, bob).

% 祖父/祖母关系：X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 孙子/孙女关系：Z是X的孙子/孙女，如果X是Z的祖父/祖母
grandchild(Z, X) :- grandparent(X, Z).

% 祖父关系：X是Z的祖父（X是男性且是Z的祖父母）
grandfather(X, Z) :- grandparent(X, Z), male(X).

% 祖母关系：X是Z的祖母（X是女性且是Z的祖父母）
grandmother(X, Z) :- grandparent(X, Z), female(X).

% 定义性别
male(john).
male(david).
male(paul).
male(tom).
male(bob).

female(mary).
female(lisa).
female(ann).
female(susan).
female(emma).
female(alice).