% База фактов о семье (Family facts database in Prolog)

% Предикаты для родителей
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, dmitriy).
parent(maria, ekaterina).
parent(ivan, alexey).
parent(ivan, olga).
parent(dmitriy, svetlana).
parent(alexey, pavel).
parent(alexey, natalia).

% Предикаты для брака
married(anna, petr).
married(maria, sergey).
married(ivan, elena).
married(dmitriy, tatyana).
married(alexey, irina).

% Пол
male(petr).
male(ivan).
male(dmitriy).
male(alexey).
male(pavel).

female(anna).
female(maria).
female(ekaterina).
female(olga).
female(tatyana).
female(irina).
female(svetlana).
female(natalia).

% Предикаты для детей (обратные родительские связи)
child(X, Y) :- parent(Y, X).

% Предикат для бабушек и дедушек
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Предикат для братьев и сестер
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Предикат для братьев
brother(X, Y) :- sibling(X, Y), male(X).

% Предикат для сестер
sister(X, Y) :- sibling(X, Y), female(X).

% Предикат для мужей
husband(X, Y) :- married(X, Y).
husband(X, Y) :- married(Y, X), male(X).

% Предикат для жен
wife(X, Y) :- married(X, Y).
wife(X, Y) :- married(Y, X), female(X).