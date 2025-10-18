package body Math_Pkg_kpFpZCPUCf1DBJ1u is

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
   
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Abs_Base : Integer := Base;
   begin
      if Exponent = 0 then
         return 1;
      end if;
      
      if Base < 0 and (Exponent mod 2 = 1) then
         Abs_Base := -Base;
         for I in 1..Exponent loop
            Result := Result * Abs_Base;
         end loop;
         return -Result;
      else
         for I in 1..Exponent loop
            Result := Result * Abs_Base;
         end loop;
         return Result;
      end if;
   end Power;
   
   function Absolute_Value(Value : Integer) return Integer is
   begin
      if Value < 0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;
   
   function Max(A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : Integer) return Integer is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end Math_Pkg_kpFpZCPUCf1DBJ1u;