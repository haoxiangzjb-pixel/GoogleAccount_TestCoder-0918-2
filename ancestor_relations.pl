% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(liz, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖孙关系规则
% 如果X是Y的父(母)，Y是Z的父(母)，那么X是Z的祖父母
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 定义祖先关系（更通用的规则）
% X是Y的直接父(母)，则X是Y的祖先
ancestor(X, Y) :- parent(X, Y).

% 如果X是Z的父(母)，且Z是Y的祖先，则X是Y的祖先
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% 测试示例
% ?- grandparent(tom, liz). % 应该返回 true
% ?- grandparent(tom, ann). % 应该返回 true
% ?- grandparent(bob, ann). % 应该返回 true
% ?- grandparent(tom, jim). % 应该返回 true