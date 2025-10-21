% База фактов о семье (Family facts database in Prolog)

% Предикаты для обозначения родительских отношений (Parent relationships)
parent(anna, bob).
parent(anna, carol).
parent(david, bob).
parent(david, carol).
parent(eve, frank).
parent(eve, grace).
parent(john, frank).
parent(john, grace).
parent(bob, iris).
parent(bob, jack).
parent(carol, lisa).
parent(carol, mike).
parent(frank, kate).
parent(frank, luke).
parent(grace, mona).
parent(grace, nick).

% Предикаты для обозначения пола (Gender predicates)
male(bob).
male(david).
male(frank).
male(john).
male(jack).
male(mike).
male(luke).
male(nick).

female(anna).
female(carol).
female(eve).
female(iris).
female(grace).
female(kate).
female(lisa).
female(mona).

% Предикаты для обозначения братских и сестринских отношений (Siblings)
sibling(bob, carol).
sibling(carol, bob).
sibling(frank, grace).
sibling(grace, frank).
sibling(iris, jack).
sibling(jack, iris).
sibling(lisa, mike).
sibling(mike, lisa).
sibling(kate, luke).
sibling(luke, kate).
sibling(mona, nick).
sibling(nick, mona).

% Правила для определения бабушек и дедушек (Grandparents)
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Правила для определения детей (Children)
child(X, Y) :- parent(Y, X).

% Правила для определения сыновей (Sons)
son(X, Y) :- parent(Y, X), male(X).

% Правила для определения дочерей (Daughters)
daughter(X, Y) :- parent(Y, X), female(X).

% Правила для определения дедушек (Grandfathers)
grandfather(X, Z) :- grandparent(X, Z), male(X).

% Правила для определения бабушек (Grandmothers)
grandmother(X, Z) :- grandparent(X, Z), female(X).