function avg = HdycCHQn0B(vector)
% HdycCHQn0B Вычисляет среднее значение элементов вектора.
%   avg = HdycCHQn0B(vector) возвращает среднее арифметическое 
%   всех элементов входного вектора vector.
%
%   Пример:
%   v = [1 2 3 4 5];
%   mean_val = HdycCHQn0B(v);
%   disp(mean_val);  % Выводит 3

    if isempty(vector)
        error('Входной вектор не должен быть пустым.');
    end
    
    % Вычисляем сумму всех элементов
    sum_elements = sum(vector);
    
    % Получаем количество элементов
    num_elements = length(vector);
    
    % Вычисляем среднее значение
    avg = sum_elements / num_elements;
end