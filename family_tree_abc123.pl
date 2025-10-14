% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% Правила: mother(Mother, Child), father(Father, Child), sibling(X, Y)

% Факты о родителях
parent(ann, bob).
parent(ann, pat).
parent(ann, jim).
parent(tom, bob).
parent(tom, pat).
parent(tom, jim).
parent(pat, liz).
parent(jim, ray).

% Факты о поле
male(tom).
male(bob).
male(jim).
male(ray).

female(ann).
female(pat).
female(liz).

% Правила
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
father(Father, Child) :- parent(Father, Child), male(Father).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.