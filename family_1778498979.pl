% База фактов Prolog о семье

% Факты: parent(Родитель, Ребенок)
parent(ivan, petr).
parent(ivan, anna).
parent(maria, petr).
parent(maria, anna).
parent(petr, olga).
parent(petr, dmitry).
parent(anna, viktor).
parent(sergei, viktor).
parent(olga, elena).
parent(alexey, elena).

% Факты: male(Человек) - мужчины
male(ivan).
male(petr).
male(dmitry).
male(sergei).
male(viktor).
male(alexey).

% Факты: female(Человек) - женщины
female(maria).
female(anna).
female(olga).
female(elena).

% Правила вывода родственных связей

% Отец: мужчина, у которого есть ребенок
father(X, Y) :- parent(X, Y), male(X).

% Мать: женщина, у которой есть ребенок
mother(X, Y) :- parent(X, Y), female(X).

% Сын: мужчина, чей родитель X
son(X, Y) :- parent(Y, X), male(X).

% Дочь: женщина, чей родитель X
daughter(X, Y) :- parent(Y, X), female(X).

% Брат: мужчина, имеющий общего родителя с Y и не равный Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

% Сестра: женщина, имеющая общего родителя с Y и не равная Y
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Дедушка: отец одного из родителей
grandfather(X, Y) :- parent(X, Z), parent(Z, Y), male(X).

% Бабушка: мать одного из родителей
grandmother(X, Y) :- parent(X, Z), parent(Z, Y), female(X).

% Супруги (упрощенно: если у них есть общий ребенок)
spouse(X, Y) :- parent(X, Z), parent(Y, Z), X \= Y.

% Дядя: брат одного из родителей
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% Тетя: сестра одного из родителей
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
