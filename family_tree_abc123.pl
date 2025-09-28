% База фактов Prolog о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определение полов
male(john).
male(mike).
male(alex).
female(mary).
female(lisa).
female(susan).

% Отношения родитель-ребенок
parent(mary, lisa).  % Мэри - мать Лизы
parent(mary, alex).  % Мэри - мать Алекса
parent(john, lisa).  % Джон - отец Лизы
parent(john, alex).  % Джон - отец Алекса
parent(susan, mike). % Сюзан - мать Майка
parent(alex, mike).  % Алекс - отец Майка