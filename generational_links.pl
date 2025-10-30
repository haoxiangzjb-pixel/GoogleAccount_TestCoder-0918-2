% 定义基本的父子关系
parent(anthony, betty).
parent(anthony, carl).
parent(betty, diana).
parent(betty, eddie).
parent(carl, felicia).
parent(diana, george).
parent(eddie, hannah).
parent(felicia, ivan).
parent(george, julia).
parent(hannah, kevin).

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
male(anthony).
male(carl).
male(george).
male(eddie).
male(ivan).
male(kevin).

% 判断是否为女性
female(betty).
female(diana).
female(felicia).
female(hannah).
female(julia).