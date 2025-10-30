% 定义父子关系的基本事实
parent(john, mary).
parent(john, bob).
parent(mary, alice).
parent(mary, tom).
parent(bob, lisa).
parent(bob, sam).
parent(alice, grace).
parent(tom, david).

% 定义祖父母关系规则
% 如果X是Y的父/母，且Y是Z的父/母，则X是Z的祖父母
grandparent(X, Z) :- 
    parent(X, Y), 
    parent(Y, Z).

% 定义祖父关系（如果需要特别标识男性祖父母）
grandfather(X, Z) :- 
    grandparent(X, Z), 
    male(X).

% 定义祖母关系（如果需要特别标识女性祖父母）
grandmother(X, Z) :- 
    grandparent(X, Z), 
    female(X).

% 定义性别基本事实（可选，用于区分祖父母类型）
male(john).
male(bob).
male(tom).
male(sam).
male(david).

female(mary).
female(alice).
female(lisa).
female(grace).