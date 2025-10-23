% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(tom, ann).
parent(ann, pat).
parent(pat, jim).

% 定义祖孙关系的规则
% X是Y的祖父/祖母，如果X是Z的父母，且Z是Y的父母
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% 定义祖先关系（更通用的关系）
% X是Y的祖先，如果X是Y的直接父母
ancestor(X, Y) :- parent(X, Y).
% X是Y的祖先，如果X是Z的父母，且Z是Y的祖先
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).