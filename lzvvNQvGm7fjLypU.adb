package body lzvvNQvGm7fjLypU is

   function Add(A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : Float) return Float is
   begin
      return Base ** Exponent;
   end Power;
   
   function Square_Root(Value : Float) return Float is
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      return Value ** 0.5;
   end Square_Root;
   
   function Max(A, B : Float) return Float is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : Float) return Float is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end lzvvNQvGm7fjLypU;