-- Ada program demonstrating task parallelism
-- Multiple tasks will print messages concurrently

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Calendar;
with Ada.Calendar.Formatting;

procedure vu7IZi9Qit is

   -- Define a task type for printing messages
   task type Printer_Task is
      entry Start(Id : in Integer);
   end Printer_Task;

   -- Implementation of the task
   task body Printer_Task is
      My_Id : Integer;
      Seed : Ada.Numerics.Float_Random.Generator;
      Delay_Time : Float;
   begin
      accept Start(Id : in Integer) do
         My_Id := Id;
      end Start;
      
      -- Initialize random number generator
      Ada.Numerics.Float_Random.Reset(Seed);
      
      -- Generate a random delay to make the output more interesting
      Delay_Time := Ada.Numerics.Float_Random.Random(Seed) * 2.0; -- 0 to 2 seconds
      
      delay Duration(Delay_Time);
      
      Put_Line("Task " & Integer'Image(My_Id) & " is printing message at " 
               & Ada.Calendar.Formatting.Image(Ada.Calendar.Clock));
      
      delay Duration(Delay_Time); -- Delay again before printing second message
      
      Put_Line("Task " & Integer'Image(My_Id) & " finished printing at " 
               & Ada.Calendar.Formatting.Image(Ada.Calendar.Clock));
   end Printer_Task;

   -- Create multiple tasks
   Task1 : Printer_Task;
   Task2 : Printer_Task;
   Task3 : Printer_Task;
   Task4 : Printer_Task;
   Task5 : Printer_Task;

begin
   Put_Line("Starting task parallelism demonstration");
   Put_Line("Creating 5 tasks that will print messages concurrently...");
   
   -- Start all tasks
   Task1.Start(1);
   Task2.Start(2);
   Task3.Start(3);
   Task4.Start(4);
   Task5.Start(5);
   
   Put_Line("All tasks have been started. Waiting for them to complete...");
   
   -- The main procedure will terminate when all tasks complete
   
end vu7IZi9Qit;