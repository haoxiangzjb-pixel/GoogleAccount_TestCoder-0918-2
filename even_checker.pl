% Predicate to check if a number is even
% even(Number) succeeds if Number is an even integer

even(N) :-
    N mod 2 =:= 0.

% Example usage:
% ?- even(4).
% true.
%
% ?- even(7).
% false.