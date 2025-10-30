% 定义基本的父子关系
parent(henry, mary).
parent(henry, james).
parent(mary, linda).
parent(mary, robert).
parent(james, patricia).
parent(linda, daniel).
parent(robert, jessica).
parent(patricia, thomas).
parent(daniel, sarah).
parent(jessica, anthony).

% 祖父/祖母关系：X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 孙子/孙女关系：Z是X的孙子/孙女，如果X是Z的祖父/祖母
grandchild(Z, X) :- grandparent(X, Z).

% 曾祖父/曾祖母关系
greatgrandparent(X, Z) :- parent(X, Y), grandparent(Y, Z).

% 曾孙子/曾孙女关系
greatgrandchild(Z, X) :- greatgrandparent(X, Z).

% 判断是否为祖先关系（递归定义）
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

% 判断是否为后代关系
descendant(Z, X) :- ancestor(X, Z).

% 判断是否为男性
male(henry).
male(james).
male(robert).
male(daniel).
male(thomas).
male(anthony).

% 判断是否为女性
female(mary).
female(linda).
female(patricia).
female(jessica).
female(sarah).