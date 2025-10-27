with Ada.Text_IO; use Ada.Text_IO;

procedure Parallel_Print is

   task Task_1;
   task Task_2;
   task Task_3;

   task body Task_1 is
   begin
      for I in 1..5 loop
         Put_Line("Task 1: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以允许其他任务运行
      end loop;
   end Task_1;

   task body Task_2 is
   begin
      for I in 1..5 loop
         Put_Line("Task 2: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以允许其他任务运行
      end loop;
   end Task_2;

   task body Task_3 is
   begin
      for I in 1..5 loop
         Put_Line("Task 3: Message " & Integer'Image(I));
         delay 0.1;  -- 稍微延迟以允许其他任务运行
      end loop;
   end Task_3;

begin
   Put_Line("Starting parallel tasks...");
   -- 等待所有任务完成（通过程序结束隐式完成）
   Put_Line("All tasks completed.");
end Parallel_Print;