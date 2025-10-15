% 定义父子关系的示例事实
parent(tom, bob).
parent(bob, liz).
parent(pam, bob).
parent(pam, pat).
parent(pat, jim).
parent(jim, ann).

% 定义祖孙关系规则
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖父关系（如果祖父是男性）
grandfather(X, Z) :-
    grandparent(X, Z),
    male(X).

% 定义祖母关系（如果祖母是女性）
grandmother(X, Z) :-
    grandparent(X, Z),
    female(X).

% 定义性别
male(tom).
male(bob).
male(jim).
female(pam).
female(liz).
female(pat).
female(ann).