% Define parent-child relationships
parent(tom, bob).
parent(bob, liz).
parent(pam, bob).
parent(pam, ann).
parent(tom, pat).
parent(pat, jim).

% Define grandparent-grandchild rules
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% Define grandfather-grandchild rules
grandfather(X, Z) :-
    grandparent(X, Z),
    male(X).

% Define grandmother-grandchild rules
grandmother(X, Z) :-
    grandparent(X, Z),
    female(X).

% Define gender facts
male(tom).
male(bob).
male(jim).
male(pat).

female(pam).
female(liz).
female(ann).