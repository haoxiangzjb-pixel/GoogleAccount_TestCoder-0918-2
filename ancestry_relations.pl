% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(tom, ann).
parent(ann, pat).
parent(pat, jim).

% 定义祖孙关系规则
% X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 定义孙子/孙女关系规则
% Z是X的孙子/孙女，如果X是Z的祖父/祖母
grandchild(Z, X) :- grandparent(X, Z).

% 定义曾祖孙关系（可选扩展）
greatgrandparent(X, Z) :- parent(X, Y), grandparent(Y, Z).