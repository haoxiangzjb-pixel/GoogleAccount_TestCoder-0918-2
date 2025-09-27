% База фактов о семье на языке Prolog

% Предикаты для родительских отношений (родитель, ребенок)
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Предикаты для пола (имя, пол)
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Правила для определения бабушек и дедушек
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Правило для определения братьев и сестер (одинаковый родитель)
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.