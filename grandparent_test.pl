% 定义基本的父子关系
parent(tom, bob).
parent(bob, liz).
parent(tom, ann).
parent(ann, pat).
parent(pat, jim).
parent(mary, susan).
parent(susan, rick).
parent(rick, lucy).

% 祖父/祖母关系：X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 孙子/孙女关系：Z是X的孙子/孙女，如果X是Z的祖父/祖母
grandchild(Z, X) :- grandparent(X, Z).

% 曾祖父/曾祖母关系
greatgrandparent(X, Z) :- parent(X, Y), grandparent(Y, Z).

% 曾孙子/曾孙女关系
greatgrandchild(Z, X) :- greatgrandparent(X, Z).

% 同胞兄弟姐妹关系（基于共同父母）
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% 叔叔/伯父/舅舅关系（父亲的兄弟或母亲的兄弟）
uncle(X, Z) :- parent(Y, Z), sibling(X, Y), male(X).

% 阿姨/姑姑/婶婶关系（父亲的姐妹或母亲的姐妹）
aunt(X, Z) :- parent(Y, Z), sibling(X, Y), female(X).