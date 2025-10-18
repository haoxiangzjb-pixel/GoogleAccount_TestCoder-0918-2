% Example usage of the solve_linear_system function

% Example 1: 3x3 system
A1 = [2, 1, 1;
      1, 3, 2;
      1, 0, 0];
b1 = [4; 5; 1];

x1 = solve_linear_system(A1, b1);
fprintf('Solution for example 1:\n');
fprintf('x = [%f; %f; %f]\n', x1(1), x1(2), x1(3));

% Verify the solution
residual1 = A1 * x1 - b1;
fprintf('Residual (should be close to zero): [%f; %f; %f]\n', residual1(1), residual1(2), residual1(3));
fprintf('\n');

% Example 2: 2x2 system
A2 = [3, 2;
      2, 6];
b2 = [11; 24];

x2 = solve_linear_system(A2, b2);
fprintf('Solution for example 2:\n');
fprintf('x = [%f; %f]\n', x2(1), x2(2));

% Verify the solution
residual2 = A2 * x2 - b2;
fprintf('Residual (should be close to zero): [%f; %f]\n', residual2(1), residual2(2));