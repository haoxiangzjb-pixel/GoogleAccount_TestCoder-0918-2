% База фактов о семье

% Предикат 'parent(Parent, Child)' означает, что Parent - родитель Child
parent(ann, brian).
parent(ann, chris).
parent(ann, diana).
parent(bob, brian).
parent(bob, chris).
parent(bob, diana).
parent(brian, emma).
parent(brian, fred).
parent(chris, george).
parent(diana, helen).
parent(diana, ian).

% Предикат 'male(Person)' указывает, что Person - мужчина
male(bob).
male(brian).
male(chris).
male(fred).
male(george).
male(ian).

% Предикат 'female(Person)' указывает, что Person - женщина
female(ann).
female(diana).
female(emma).
female(helen).

% Правило 'father(Father, Child)' выводится из 'parent' и 'male'
father(Father, Child) :- parent(Father, Child), male(Father).

% Правило 'mother(Mother, Child)' выводится из 'parent' и 'female'
mother(Mother, Child) :- parent(Mother, Child), female(Mother).

% Правило 'grandparent(Grandparent, Grandchild)' выводится через 'parent'
grandparent(Grandparent, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild).

% Правило 'sibling(X, Y)' означает, что X и Y - братья или сестры (не идентичны)
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% Правило 'brother(Brother, Sibling)' выводится из 'sibling' и 'male'
brother(Brother, Sibling) :- sibling(Brother, Sibling), male(Brother).

% Правило 'sister(Sister, Sibling)' выводится из 'sibling' и 'female'
sister(Sister, Sibling) :- sibling(Sister, Sibling), female(Sister).
