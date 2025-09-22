% Family Facts Database

% Gender facts
male(ivan).
male(petr).
male(alexey).
female(maria).
female(olga).
female(ekaterina).

% Parent-child relationships
parent(ivan, petr).
parent(ivan, olga).
parent(maria, petr).
parent(maria, olga).
parent(petr, alexey).
parent(ekaterina, alexey).

% Derived facts can be added here, such as:
% father(X, Y) :- parent(X, Y), male(X).
% mother(X, Y) :- parent(X, Y), female(X).
% sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.