% Family facts in Prolog

% Parent relationships
parent(alex, bob).
parent(alex, carol).
parent(beth, bob).
parent(beth, carol).
parent(carol, dave).
parent(carol, eve).
parent(dave, frank).
parent(dave, grace).

% Gender facts
male(alex).
male(bob).
male(dave).
male(frank).

female(beth).
female(carol).
female(eve).
female(grace).

% Derived relationships
father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
grandparent(GP, GC) :- parent(GP, X), parent(X, GC).
grandfather(GF, GC) :- grandparent(GF, GC), male(GF).
grandmother(GM, GC) :- grandparent(GM, GC), female(GM).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).