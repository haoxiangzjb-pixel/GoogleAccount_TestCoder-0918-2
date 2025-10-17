package body Math_Operations is
   
   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base : in Float; Exponent : in Integer) return Float is
      Result : Float := 1.0;
      Abs_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         Abs_Exponent := -Exponent;
         for I in 1 .. Abs_Exponent loop
            Result := Result * Base;
         end loop;
         return 1.0 / Result;
      else
         for I in 1 .. Abs_Exponent loop
            Result := Result * Base;
         end loop;
         return Result;
      end if;
   end Power;
   
   function Square_Root(Value : in Float) return Float is
      X : Float := Value;
      Y : Float := 0.0;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      elsif Value = 0.0 then
         return 0.0;
      else
         loop
            Y := (X + Value / X) / 2.0;
            exit when abs (X - Y) < 1.0E-10;
            X := Y;
         end loop;
         return Y;
      end if;
   end Square_Root;
   
   function Max(A, B : in Float) return Float is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : in Float) return Float is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end Math_Operations;