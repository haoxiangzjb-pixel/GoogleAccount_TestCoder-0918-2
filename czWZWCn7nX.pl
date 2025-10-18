% База фактов о семье (Family facts in Prolog)

% Мужчины (Men)
male(alex).
male(bob).
male(charlie).
male(david).
male(edward).

% Женщины (Women)
female(anna).
female(beth).
female(catherine).
female(diana).
female(elena).

% Родители (Parents)
% parent(X, Y) означает что X родитель Y (X is parent of Y)
parent(alex, bob).
parent(alex, catherine).
parent(anna, bob).
parent(anna, catherine).

parent(bob, david).
parent(bob, elena).
parent(beth, david).
parent(beth, elena).

parent(charlie, diana).
parent(catherine, diana).

% Браки (Marriages)
married(alex, anna).
married(anna, alex).
married(bob, beth).
married(beth, bob).
married(charlie, catherine).
married(catherine, charlie).

% Правила (Rules)

% Ребенок (Child)
child(X, Y) :- parent(Y, X).

% Отношения (Relations)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Брат (Brother)
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.

% Сестра (Sister)
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \= Y.

% Дедушка (Grandfather)
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).

% Бабушка (Grandmother)
grandmother(X, Z) :- female(X), parent(X, Y), parent(Y, Z).

% Дядя (Uncle)
uncle(X, Z) :- male(X), parent(Y, Z), brother(X, Y).
uncle(X, Z) :- male(X), parent(Y, Z), (married(X, W), sister(W, Y); married(W, X), sister(W, Y)).

% Тетя (Aunt)
aunt(X, Z) :- female(X), parent(Y, Z), sister(X, Y).
aunt(X, Z) :- female(X), parent(Y, Z), (married(X, W), brother(W, Y); married(W, X), brother(W, Y)).