% 祖孙关系判断规则

% 基础事实：父子关系
parent(john, bob).      % John 是 Bob 的父亲
parent(bob, mike).      % Bob 是 Mike 的父亲
parent(bob, anna).      % Bob 是 Anna 的父亲
parent(mike, tom).      % Mike 是 Tom 的父亲
parent(anna, lily).     % Anna 是 Lily 的父亲/母亲

% 递归规则：祖父母关系
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 规则：祖父关系（X是Z的祖父）
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 规则：祖母关系（X是Z的祖母）
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 性别定义
male(john).
male(bob).
male(mike).
male(tom).
female(anna).
female(lily).

% 查询示例：
% ?- grandparent(john, X).  % John的孙子/孙女是谁？
% ?- grandfather(john, tom). % John是Tom的祖父吗？
% ?- grandmother(anna, lily). % Anna是Lily的祖母吗？
