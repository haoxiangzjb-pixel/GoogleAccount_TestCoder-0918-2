function result = calculate_mean(data)
% This function calculates the mean value of the input data
% Input: data - a vector or matrix of numbers
% Output: result - the mean value

if isempty(data)
    error('Input data cannot be empty');
end

result = mean(data(:)); % Calculate mean treating input as a column vector
end