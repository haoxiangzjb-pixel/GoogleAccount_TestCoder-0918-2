% 定义基本的父子关系
parent(tom, bob).
parent(bob, liz).
parent(tom, ann).
parent(ann, pat).
parent(pat, jim).

% 祖父/祖母关系：X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 孙子/孙女关系：Z是X的孙子/孙女，如果X是Z的祖父/祖母
grandchild(Z, X) :- grandparent(X, Z).

% 曾祖父/曾祖母关系
greatgrandparent(X, Z) :- parent(X, Y), grandparent(Y, Z).

% 曾孙子/曾孙女关系
greatgrandchild(Z, X) :- greatgrandparent(X, Z).