-- math_ops.adb
-- Тело пакета Ada для базовых математических операций

package body Math_Ops is

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

   function Divide(Numerator : Integer; Denominator : Integer) return Float is
   begin
      if Denominator = 0 then
         raise Constraint_Error with "Деление на ноль недопустимо.";
      end if;
      return Float(Numerator) / Float(Denominator);
   end Divide;

end Math_Ops;