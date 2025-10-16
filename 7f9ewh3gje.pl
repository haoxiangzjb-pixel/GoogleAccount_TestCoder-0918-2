% Prolog predicate to check if a number is even
is_even(N) :-
    N mod 2 =:= 0.

% Test cases:
% ?- is_even(4).    % Should return true
% ?- is_even(7).    % Should return false
% ?- is_even(0).    % Should return true
% ?- is_even(-2).   % Should return true
% ?- is_even(-3).   % Should return false