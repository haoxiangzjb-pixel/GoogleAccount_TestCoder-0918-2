-- Ada package specification for mathematical operations
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