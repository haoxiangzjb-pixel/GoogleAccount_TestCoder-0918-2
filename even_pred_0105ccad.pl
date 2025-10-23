% Prolog predicate to check if a number is even
% Usage: even(Number) succeeds if Number is even, fails otherwise

even(Number) :-
    integer(Number),           % Ensure the input is an integer
    Number mod 2 =:= 0.       % Check if the number is divisible by 2

% Alternative implementation using recursion
% even(0).
% even(N) :- N > 0, N1 is N - 2, even(N1).
% even(N) :- N < 0, N1 is N + 2, even(N1).