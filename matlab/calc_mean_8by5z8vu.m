function avg = calculateMean(data)
    % This function calculates the mean of an input array 'data'.
    % It handles vectors and matrices.
    % For a matrix, it calculates the mean of all elements.

    % Check if input is empty
    if isempty(data)
        avg = NaN; % Return NaN for empty input
        return;
    end

    % Calculate the mean
    avg = mean(data(:)); % Flatten to column vector before calculating mean
end