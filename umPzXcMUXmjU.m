function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves a linear system of equations Ax = b
% 
% Inputs:
%   A - Coefficient matrix (n x n)
%   b - Right-hand side vector (n x 1)
%
% Output:
%   solution - Solution vector x such that Ax = b

    % Check if A is square
    [rows, cols] = size(A);
    if rows ~= cols
        error('Matrix A must be square');
    end
    
    % Check if dimensions match
    if length(b) ~= rows
        error('Dimensions of A and b do not match');
    end
    
    % Check if matrix is singular
    if rcond(A) < eps
        warning('Matrix is close to singular; solution may be inaccurate');
    end
    
    % Solve the system
    solution = A \ b;
end