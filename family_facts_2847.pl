% База фактов о семье (Family facts database in Prolog)

% Предикаты для родительских отношений (Parent relationships)
parent(anna, maria).
parent(anna, ivan).
parent(pavel, maria).
parent(pavel, ivan).
parent(maria, dmitry).
parent(maria, ekaterina).
parent(ivan, alexei).
parent(ivan, olga).
parent(dmitry, svetlana).
parent(dmitry, andrey).

% Предикаты для пола (Gender predicates)
male(pavel).
male(ivan).
male(dmitry).
male(alexei).
male(andrey).

female(anna).
female(maria).
female(ekaterina).
female(olga).
female(svetlana).

% Предикаты для брака (Marriage predicates)
married(anna, pavel).
married(pavel, anna).
married(maria, dmitry).
married(dmitry, maria).
married(ivan, olga).
married(olga, ivan).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).