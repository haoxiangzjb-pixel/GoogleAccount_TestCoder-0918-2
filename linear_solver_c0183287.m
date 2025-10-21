function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves the linear system Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - right-hand side vector (n x 1)
% Output:
%   solution - solution vector x such that Ax = b

% Check if the inputs are valid
if size(A, 1) ~= size(A, 2)
    error('Matrix A must be square');
end

if size(A, 1) ~= length(b)
    error('Matrix A and vector b must have compatible dimensions');
end

% Check if the matrix is singular
if rcond(A) < eps
    warning('Matrix is singular or nearly singular');
    solution = A \ b;  % Use backslash operator which handles singular cases
else
    % Solve the system using the backslash operator (most efficient)
    solution = A \ b;
end

% Optional: Display the result
fprintf('Solution vector x:\n');
for i = 1:length(solution)
    fprintf('x(%d) = %.6f\n', i, solution(i));
end
end