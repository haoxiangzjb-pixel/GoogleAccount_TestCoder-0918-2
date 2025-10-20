% База фактов о семье (Family facts database in Prolog)

% Предикаты для родителей
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Предикаты для пола
male(tom).
male(bob).
male(jim).
female(pam).
female(liz).
female(ann).
female(pat).

% Правила для определения детей
child(X, Y) :- parent(Y, X).

% Правила для определения матерей
mother(X, Y) :- parent(X, Y), female(X).

% Правила для определения отцов
father(X, Y) :- parent(X, Y), male(X).

% Правила для определения братьев и сестер
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Правила для определения бабушек и дедушек
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Правила для определения бабушки (по отцовской линии)
paternal_grandmother(X, Z) :- father(X, Y), father(Y, Z), female(X).
paternal_grandfather(X, Z) :- father(X, Y), father(Y, Z), male(X).

% Правила для определения дедушки (по материнской линии)
maternal_grandmother(X, Z) :- father(X, Y), mother(Y, Z), female(X).
maternal_grandfather(X, Z) :- father(X, Y), mother(Y, Z), male(X).

% Правила для определения дяди и тети
uncle(X, Z) :- parent(Y, Z), sibling(X, Y), male(X).
aunt(X, Z) :- parent(Y, Z), sibling(X, Y), female(X).