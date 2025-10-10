-- math_operations-d1e2f3.adb
-- Тело пакета Ada для базовых математических операций

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

   procedure Divide(Dividend, Divisor : Integer; Quotient, Remainder : out Integer) is
   begin
      if Divisor = 0 then
         raise Constraint_Error with "Деление на ноль!";
      end if;
      Quotient := Dividend / Divisor;
      Remainder := Dividend rem Divisor;
   end Divide;

end Math_Operations;