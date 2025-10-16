function solution = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves a linear system of equations Ax = b
% 
% Inputs:
%   A - coefficient matrix (n x n)
%   b - constant vector (n x 1)
%
% Output:
%   solution - solution vector (n x 1) such that Ax = b

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
        warning('Matrix is singular or nearly singular');
        solution = A \ b; % Use backslash operator which handles singular cases
    else
        solution = A \ b; % Solve using MATLAB's backslash operator
    end
end