% База фактов о семье

% Факты о родителях (Parent, Child)
parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Факты о муже/жене (Husband, Wife)
husband(tom, pam).
husband(bob, liz).

% Правила для отношений

% Мама
mother(Mom, Child) :- parent(Mom, Child), female(Mom).

% Папа
father(Dad, Child) :- parent(Dad, Child), male(Dad).

% Брат
brother(Brother, Person) :- parent(Parent, Brother), parent(Parent, Person), male(Brother), Brother \= Person.

% Сестра
sister(Sister, Person) :- parent(Parent, Sister), parent(Parent, Person), female(Sister), Sister \= Person.

% Дедушка по отцовской линии
grandfather(GF, GC) :- father(GF, Parent), parent(Parent, GC).

% Бабушка по отцовской линии
grandmother(GM, GC) :- mother(GM, Parent), parent(Parent, GC).

% Тетя (сестра родителя)
aunt(Aunt, NephewNiece) :- sister(Aunt, Parent), parent(Parent, NephewNiece).

% Дядя (брат родителя)
uncle(Uncle, NephewNiece) :- brother(Uncle, Parent), parent(Parent, NephewNiece).

% Двоюродный брат/сестра (ребенок тети или дяди)
cousin(Cousin, Person) :- (aunt(Aunt, Person); uncle(Uncle, Person)), parent(Aunt, Cousin); parent(Uncle, Cousin).

% Предикаты для полов
male(tom).
male(bob).
male(liz).
male(jim).

female(ann).
female(pat).