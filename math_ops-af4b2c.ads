-- math_ops.ads
-- Пакет Ada для базовых математических операций

package Math_Ops is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (с проверкой деления на ноль)
   function Divide(Numerator : Integer; Denominator : Integer) return Float;

end Math_Ops;