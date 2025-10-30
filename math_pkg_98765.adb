-- math_pkg_98765.adb: Пакет Ada для математических операций

package Math_Pkg is
   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (целочисленное деление)
   function Divide(A, B : Integer) return Integer;
   
   -- Функция для возведения в степень
   function Power(Base, Exponent : Integer) return Integer;
   
   -- Функция для нахождения остатка от деления
   function Modulo(A, B : Integer) return Integer;
   
   -- Функция для вычисления факториала
   function Factorial(N : Integer) return Integer;
end Math_Pkg;

package body Math_Pkg is
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
   
   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Temp_Base : Integer := Base;
      Temp_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      while Temp_Exponent > 0 loop
         Result := Result * Temp_Base;
         Temp_Exponent := Temp_Exponent - 1;
      end loop;
      
      return Result;
   end Power;
   
   function Modulo(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Modulo by zero";
      end if;
      return A rem B;
   end Modulo;
   
   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
      I : Integer;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial of negative number not defined";
      end if;
      
      for I in 1..N loop
         Result := Result * I;
      end loop;
      
      return Result;
   end Factorial;
end Math_Pkg;