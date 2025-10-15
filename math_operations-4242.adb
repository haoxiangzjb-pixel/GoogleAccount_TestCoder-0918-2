-- math_operations.adb: Пакет Ada для базовых математических операций

package Math_Operations is
   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (целочисленное деление)
   function Divide(A, B : Integer) return Integer;
   
   -- Процедура для вывода приветствия
   procedure Print_Greeting;
end Math_Operations;

package body Math_Operations is
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   procedure Print_Greeting is
   begin
      Put_Line("Hello from Math_Operations package!");
   end Print_Greeting;

end Math_Operations;