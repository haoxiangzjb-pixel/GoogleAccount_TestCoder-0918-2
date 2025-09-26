% This function calculates the mean of an input array
function result = mean_func(input_array)
    if isempty(input_array)
        result = NaN; % Return NaN for empty input
        return;
    end
    result = sum(input_array(:)) / numel(input_array);
end
