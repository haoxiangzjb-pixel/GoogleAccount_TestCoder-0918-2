% Prolog rules for grandparent-grandchild relationship

% Define parent relationships (example facts)
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Define grandparent rule
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% Define grandfather rule
grandfather(X, Z) :-
    grandparent(X, Z),
    male(X).

% Define grandmother rule
grandmother(X, Z) :-
    grandparent(X, Z),
    female(X).

% Define gender (example facts)
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Additional helper rules
% Check if X is a grandchild of Z
grandchild(X, Z) :-
    grandparent(Z, X).

% Find all grandchildren of a person
grandchildren_of(Person, Grandchildren) :-
    findall(Child, grandparent(Person, Child), Grandchildren).