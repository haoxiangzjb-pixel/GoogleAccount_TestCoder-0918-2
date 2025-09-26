% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% Отношения: father, mother, son, daughter, sibling, uncle, aunt, grandparent, cousin определяются через правила

% Мужчины
male(john).
male(mike).
male(dave).
male(alex).

% Женщины
female(eve).
female(lisa).
female(jane).
female(sarah).

% Родители
parent(john, lisa).
parent(john, mike).
parent(eve, lisa).
parent(eve, mike).

parent(dave, alex).
parent(dave, sarah).
parent(jane, alex).
parent(jane, sarah).

parent(lisa, ann).
parent(alex, ann).

% Правила

% Отец
father(Father, Child) :- parent(Father, Child), male(Father).

% Мать
mother(Mother, Child) :- parent(Mother, Child), female(Mother).

% Сын
son(Child, Parent) :- parent(Parent, Child), male(Child).

% Дочь
daughter(Child, Parent) :- parent(Parent, Child), female(Child).

% Братья и сестры
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

% Дядя
uncle(Uncle, Person) :- parent(Parent, Person), sibling(Uncle, Parent), male(Uncle).

% Тетя
aunt(Aunt, Person) :- parent(Parent, Person), sibling(Aunt, Parent), female(Aunt).

% Бабушка
grandmother(Grandmother, Grandchild) :- parent(Grandparent, Parent), parent(Parent, Grandchild), female(Grandmother).

% Двоюродный брат/сестра
cousin(X, Y) :- parent(Parent1, X), parent(Parent2, Y), sibling(Parent1, Parent2).