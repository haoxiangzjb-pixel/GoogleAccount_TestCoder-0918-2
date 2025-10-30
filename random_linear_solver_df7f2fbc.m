function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解

    % 检查输入参数
    if nargin ~= 2
        error('需要两个输入参数: A (系数矩阵) 和 b (常数向量)');
    end
    
    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if length(b) ~= m
        error('矩阵A的行数必须与向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('矩阵不是方阵，可能无解或有无穷多解');
    end
    
    % 检查矩阵的行列式（对于方阵）
    if m == n
        detA = det(A);
        if abs(detA) < eps
            warning('矩阵接近奇异，可能无唯一解');
        end
    end
    
    % 求解线性方程组
    % 使用左除运算符，MATLAB会自动选择最优算法
    x = A \ b;
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning(['解的残差较大: ', num2str(residual)]);
    end
    
    fprintf('线性方程组 Ax = b 的解为:\n');
    disp(x');
    
    fprintf('验证: A*x - b = \n');
    disp((A * x - b)');
    fprintf('残差范数: %f\n', residual);
end

% 示例用法
function example_usage()
    fprintf('=== 示例 1: 唯一解 ===\n');
    A1 = [2, 1, 1; 1, 3, 2; 1, 0, 0];
    b1 = [2; 5; 1];
    x1 = solve_linear_system(A1, b1);
    
    fprintf('\n=== 示例 2: 3x3 系统 ===\n');
    A2 = [3, 2, -1; 2, -2, 4; -1, 0.5, -1];
    b2 = [1; -2; 0];
    x2 = solve_linear_system(A2, b2);
end