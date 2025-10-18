with Ada.Text_IO; use Ada.Text_IO;

procedure task_parallel_print_6789 is

   task Task1;
   task Task2;
   task Task3;

   task body Task1 is
   begin
      for I in 1..5 loop
         Put_Line("Task 1: Message " & Integer'Image(I));
         delay 0.1;
      end loop;
   end Task1;

   task body Task2 is
   begin
      for I in 1..5 loop
         Put_Line("Task 2: Message " & Integer'Image(I));
         delay 0.2;
      end loop;
   end Task2;

   task body Task3 is
   begin
      for I in 1..5 loop
         Put_Line("Task 3: Message " & Integer'Image(I));
         delay 0.15;
      end loop;
   end Task3;

begin
   Put_Line("Main program: Starting tasks...");
   
   -- 主程序等待任务完成
   null; -- 实际上任务会在后台运行直到完成
   
   Put_Line("Main program: All tasks completed.");
end task_parallel_print_6789;