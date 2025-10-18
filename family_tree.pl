% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(пётр).
male(семён).
male(алексей).
male(борис).
male(виктор).

% Женщины (Females)
female(мария).
female(анна).
female(екатерина).
female(ольга).
female(дарья).
female(наташа).

% Родители (Parents)
% parent(X, Y) означает, что X - родитель Y (X is parent of Y)
parent(иван, пётр).
parent(иван, екатерина).
parent(мария, пётр).
parent(мария, екатерина).
parent(пётр, алексей).
parent(пётр, дарья).
parent(анна, алексей).
parent(анна, дарья).
parent(семён, борис).
parent(семён, ольга).
parent(екатерина, борис).
parent(екатерина, ольга).
parent(алексей, виктор).
parent(наташа, виктор).

% Браки (Marriages)
married(иван, мария).
married(пётр, анна).
married(семён, екатерина).
married(алексей, наташа).

% Правила (Rules)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
grandfather(X, Z) :- male(X), parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- female(X), parent(X, Y), parent(Y, Z).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).