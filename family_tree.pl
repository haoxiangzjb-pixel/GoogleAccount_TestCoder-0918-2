% База фактов о семье (Family facts database in Russian)
% Родители (Parents)
parent(ivan, maria).
parent(ivan, alex).
parent(anna, maria).
parent(anna, alex).
parent(peter, ivan).
parent(maria, elena).
parent(alex, dmitry).
parent(alex, svetlana).

% Пол (Gender)
male(ivan).
male(alex).
male(peter).
male(dmitry).

female(maria).
female(anna).
female(elena).
female(svetlana).

% Родственные связи (Family relationships)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).

% Брат и сестра (Brother and sister)
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).

% Дедушка и бабушка (Grandparents)
grandfather(X, Z) :- father(X, Y), parent(Y, Z).
grandmother(X, Z) :- mother(X, Y), parent(Y, Z).

% Дядя и тетя (Uncle and aunt)
uncle(X, Z) :- parent(Y, Z), brother(X, Y).
aunt(X, Z) :- parent(Y, Z), sister(X, Y).

% Двоюродные братья и сестры (Cousins)
cousin(X, Y) :- parent(PX, X), parent(PY, Y), sibling(PX, PY).