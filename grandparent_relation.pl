% 定义父子关系的基本事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖孙关系规则
% X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 定义孙子/孙女关系规则（可选）
grandchild(Z, X) :- grandparent(X, Z).

% 定义兄弟姐妹关系（可选，用于测试）
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.