function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 解向量
%
% 示例:
%   A = [2, 1; 1, -1];
%   b = [3; 0];
%   x = solve_linear_system(A, b);

    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('系数矩阵A的行数必须与向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('系数矩阵不是方阵，可能无解或有无穷多解');
    end
    
    % 检查矩阵的秩以确定解的存在性和唯一性
    rank_A = rank(A);
    augmented_matrix = [A, b];
    rank_aug = rank(augmented_matrix);
    
    if rank_A ~= rank_aug
        error('方程组无解，因为系数矩阵的秩不等于增广矩阵的秩');
    elseif rank_A < n
        warning('方程组有无穷多解，返回一个特解');
    end
    
    % 使用左除运算求解线性方程组
    x = A \ b;
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning('解的精度较低，残差为: %f', residual);
    end
end