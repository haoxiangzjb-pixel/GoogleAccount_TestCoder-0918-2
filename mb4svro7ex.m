function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves a linear system of equations Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - constant vector (n x 1)
% Output:
%   solution - solution vector (n x 1) such that Ax = b

% Check if inputs are valid
if nargin ~= 2
    error('Two inputs required: coefficient matrix A and constant vector b');
end

% Check if A is square
[rows, cols] = size(A);
if rows ~= cols
    error('Matrix A must be square');
end

% Check if dimensions match
if length(b) ~= rows
    error('Dimensions of A and b do not match');
end

% Check if the system has a unique solution by testing if A is invertible
if rcond(A) < eps
    warning('Matrix is close to singular or badly scaled. Results may be inaccurate.');
    % Try to solve using pseudoinverse
    solution = pinv(A) * b;
else
    % Solve using backslash operator (MATLAB's recommended approach)
    solution = A \ b;
end

% Verify the solution by computing A*solution - b
residual = A * solution - b;
fprintf('Residual norm: %e\n', norm(residual));

end