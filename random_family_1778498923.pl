% База фактов Prolog о семье

% Факты о родителях: parent(Родитель, Ребенок)
parent(ivan, petr).
parent(ivan, anna).
parent(maria, petr).
parent(maria, anna).
parent(petr, sergey).
parent(petr, elena).
parent(anna, dmitry).
parent(alexey, sergey).
parent(alexey, elena).
parent(nikolay, dmitry).

% Факты о поле: male(Человек), female(Человек)
male(ivan).
male(petr).
male(sergey).
male(dmitry).
male(nikolay).
male(alexey).

female(maria).
female(anna).
female(elena).

% Правила для определения отношений

% Отец: father(Отец, Ребенок)
father(X, Y) :- parent(X, Y), male(X).

% Мать: mother(Мать, Ребенок)
mother(X, Y) :- parent(X, Y), female(X).

% Сын: son(Сын, Родитель)
son(X, Y) :- parent(Y, X), male(X).

% Дочь: daughter(Дочь, Родитель)
daughter(X, Y) :- parent(Y, X), female(X).

% Брат: brother(Брат, Человек)
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

% Сестра: sister(Сестра, Человек)
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Дедушка: grandfather(Дед, Внук)
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% Бабушка: grandmother(Бабушка, Внук)
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% Супруги: spouse(Муж, Жена)
spouse(X, Y) :- parent(X, Z), parent(Y, Z), male(X), female(Y).
spouse(Y, X) :- parent(X, Z), parent(Y, Z), male(X), female(Y).

% Дядя: uncle(Дядя, Племянник)
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% Тетя: aunt(Тетя, Племянник)
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
