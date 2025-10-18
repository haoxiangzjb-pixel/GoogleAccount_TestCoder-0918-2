% Prolog predicate to check if a number is even
% Usage: is_even(Number)
is_even(Number) :-
    Number mod 2 =:= 0.

% Examples:
% ?- is_even(4).
% true.
%
% ?- is_even(5).
% false.