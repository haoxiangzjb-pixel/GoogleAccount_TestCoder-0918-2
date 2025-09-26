% Predicate to check if a number is even
is_even(0).
is_even(N) :-
    N > 0,
    N1 is N - 2,
    is_even(N1).
is_even(N) :-
    N < 0,
    N1 is N + 2,
    is_even(N1).