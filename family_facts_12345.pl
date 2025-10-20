% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(пётр).
male(сергей).
male(андрей).
male(виталий).
male(олег).

% Женщины (Females)
female(мария).
female(анна).
female(ольга).
female(екатерина).
female(татьяна).
female(юлия).

% Родители (Parents)
% Format: parent(родитель, ребёнок) - parent(Parent, Child)
parent(иван, пётр).
parent(иван, ольга).
parent(мария, пётр).
parent(мария, ольга).
parent(пётр, анна).
parent(пётр, сергей).
parent(анна, виталий).
parent(анна, юлия).
parent(сергей, татьяна).
parent(екатерина, анна).
parent(екатерина, сергей).
parent(олег, виталий).
parent(олег, юлия).
parent(ольга, татьяна).

% Предикаты для определения отца и матери (Father and mother predicates)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).

% Предикат для определения ребёнка (Child predicate)
child(X, Y) :- parent(Y, X).

% Предикат для определения брата (Brother predicate)
brother(X, Y) :- male(X), parent(Z, X), parent(Z, Y), X \= Y.

% Предикат для определения сестры (Sister predicate)
sister(X, Y) :- female(X), parent(Z, X), parent(Z, Y), X \= Y.

% Предикат для определения дедушки (Grandfather predicate)
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).

% Предикат для определения бабушки (Grandmother predicate)
grandmother(X, Z) :- female(X), parent(X, Y), parent(Y, Z).

% Предикат для определения дяди (Uncle predicate)
uncle(X, Z) :- male(X), brother(X, Y), parent(Y, Z).

% Предикат для определения тёти (Aunt predicate)
aunt(X, Z) :- female(X), sister(X, Y), parent(Y, Z).