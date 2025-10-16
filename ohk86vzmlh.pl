% Prolog predicate to check if a number is even
is_even(N) :-
    integer(N),           % Ensure N is an integer
    N mod 2 =:= 0.        % Check if N is divisible by 2

% Example usage:
% ?- is_even(4).    % returns true
% ?- is_even(5).    % returns false
% ?- is_even(-2).   % returns true
% ?- is_even(0).    % returns true