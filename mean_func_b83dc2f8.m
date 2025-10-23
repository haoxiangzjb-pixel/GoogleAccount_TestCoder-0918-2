function result = calculate_mean(data)
% This function calculates the mean of input data
% Input: data - array of numbers
% Output: result - mean value

if isempty(data)
    error('Input data cannot be empty');
end

result = sum(data(:)) / numel(data);
end