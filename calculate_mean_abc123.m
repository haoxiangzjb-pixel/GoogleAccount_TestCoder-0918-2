function result = calculate_mean(data)
% CALCULATE_MEAN computes the mean of the input data
% Input: data - array of numbers
% Output: result - mean value of the input data

    if isempty(data)
        result = NaN; % Return NaN for empty input
    else
        result = sum(data(:)) / numel(data); % Calculate mean
    end
end