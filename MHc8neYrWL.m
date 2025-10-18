function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM Solves a linear system of equations Ax = b
% Inputs:
%   A - coefficient matrix (n x n)
%   b - constant vector (n x 1)
% Output:
%   x - solution vector (n x 1)

% Check if the inputs are valid
if size(A, 1) ~= size(A, 2)
    error('Matrix A must be square');
end

if size(A, 1) ~= length(b)
    error('Dimensions of A and b must be compatible');
end

% Check if the matrix is singular
if rcond(A) < eps
    warning('Matrix is singular or nearly singular');
    x = A \ b; % Use backslash operator which handles singular matrices more gracefully
else
    % Solve the linear system using the backslash operator (more numerically stable than inv(A)*b)
    x = A \ b;
end

end