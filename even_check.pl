% Predicate to check if a number is even
% Base case: 0 is even
is_even(0).

% Recursive case: A number N is even if N-2 is even.
is_even(N) :-
    N > 0,
    N2 is N - 2,
    is_even(N2).
