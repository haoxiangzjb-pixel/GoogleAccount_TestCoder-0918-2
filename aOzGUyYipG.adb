with Ada.Text_IO; use Ada.Text_IO;

procedure aOzGUyYipG is
   task Task1;
   task Task2;
   task Task3;

   task body Task1 is
   begin
      for I in 1..5 loop
         Put_Line("Task 1: Message " & Integer'Image(I));
         delay 0.5;
      end loop;
   end Task1;

   task body Task2 is
   begin
      for I in 1..5 loop
         Put_Line("Task 2: Message " & Integer'Image(I));
         delay 0.7;
      end loop;
   end Task2;

   task body Task3 is
   begin
      for I in 1..3 loop
         Put_Line("Task 3: Message " & Integer'Image(I));
         delay 1.0;
      end loop;
   end Task3;

begin
   Put_Line("Main procedure started");
   
   -- 主程序等待所有任务完成
   null; -- 在实际应用中，您可能需要更复杂的同步机制
end aOzGUyYipG;