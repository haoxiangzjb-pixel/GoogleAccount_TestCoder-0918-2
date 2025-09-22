# Family Facts Database
% Facts about family relationships

% Parent facts
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Male and female facts
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Rules
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
