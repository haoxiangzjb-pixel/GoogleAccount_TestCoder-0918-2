% Факты о родителях: parent(Родитель, Ребенок)
parent(anna, bob).
parent(anna, carol).
parent(bob, dave).
parent(bob, frank).
parent(carol, eve).
parent(dave, grace).
parent(carol, henry).

% Факты о поле: male(Имя), female(Имя)
male(bob).
male(dave).
male(frank).
male(henry).
female(anna).
female(carol).
female(eve).
female(grace).

% Правила для вывода родственных связей
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
