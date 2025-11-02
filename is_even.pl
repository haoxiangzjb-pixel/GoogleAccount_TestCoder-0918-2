% Prolog predicate to check if a number is even
is_even(N) :-
    N mod 2 =:= 0.

% Alternative implementation using recursion (for educational purposes)
% is_even(0).
% is_even(N) :-
%     N > 0,
%     N1 is N - 2,
%     is_even(N1).
% is_even(N) :-
%     N < 0,
%     N1 is N + 2,
%     is_even(N1).