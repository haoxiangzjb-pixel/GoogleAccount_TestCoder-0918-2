-- Ada package for mathematical operations
package Math_Operations is
   -- Function to add two numbers
   function Add(A, B : Integer) return Integer;
   
   -- Function to subtract two numbers
   function Subtract(A, B : Integer) return Integer;
   
   -- Function to multiply two numbers
   function Multiply(A, B : Integer) return Integer;
   
   -- Function to divide two numbers (integer division)
   function Divide(A, B : Integer) return Integer;
   
   -- Function to calculate power of a number
   function Power(Base, Exponent : Integer) return Integer;
   
   -- Function to calculate factorial
   function Factorial(N : Integer) return Integer;
   
end Math_Operations;

-- Ada package body for mathematical operations
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
   
   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      for I in 1..Exponent loop
         Result := Result * Base;
      end loop;
      
      return Result;
   end Power;
   
   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial not defined for negative numbers";
      end if;
      
      for I in 1..N loop
         Result := Result * I;
      end loop;
      
      return Result;
   end Factorial;
   
end Math_Operations;