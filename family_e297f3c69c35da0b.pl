% База фактов о семье на языке Prolog

% Семейные отношения
parent(anna, maria).
parent(anna, ivan).
parent(pavel, maria).
parent(pavel, ivan).
parent(maria, elena).
parent(maria, dmitry).
parent(ivan, olga).
parent(ivan, sergey).
parent(ivan, natalia).
parent(elena, alexander).
parent(elena, anna2).
parent(dmitry, pavel2).
parent(olga, viktor).
parent(sergey, svetlana).

% Пол
female(anna).
female(maria).
female(elena).
female(olga).
female(natalia).
female(anna2).
female(svetlana).
male(pavel).
male(ivan).
male(dmitry).
male(alexander).
male(pavel2).
male(sergey).
male(viktor).

% Браки
married(anna, pavel).
married(maria, alexei).
married(ivan, tatyana).
married(elena, boris).

% Правила
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandfather(X, Z) :- grandparent(X, Z), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).