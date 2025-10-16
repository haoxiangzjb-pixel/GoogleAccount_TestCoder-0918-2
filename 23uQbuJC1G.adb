-- Ada package for mathematical operations
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

   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;

   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Temp_Base : Integer := Base;
      Temp_Exponent : Natural := Exponent;
   begin
      while Temp_Exponent > 0 loop
         if Temp_Exponent mod 2 = 1 then
            Result := Result * Temp_Base;
         end if;
         Temp_Base := Temp_Base * Temp_Base;
         Temp_Exponent := Temp_Exponent / 2;
      end loop;
      return Result;
   end Power;

end Math_Operations;