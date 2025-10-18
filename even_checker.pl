% Prolog predicate to check if a number is even
% Usage: is_even(Number)
is_even(Number) :-
    Number mod 2 =:= 0.

% Alternative implementation using recursion
% is_even(0).
% is_even(N) :-
%     N > 0,
%     N1 is N - 2,
%     is_even(N1).
% is_even(N) :-
%     N < 0,
%     N1 is N + 2,
%     is_even(N1).