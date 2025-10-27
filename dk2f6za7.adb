with Ada.Text_IO; use Ada.Text_IO;

procedure Parallel_Tasks is

   task Task_A;
   task Task_B;
   task Task_C;

   task body Task_A is
   begin
      for I in 1..3 loop
         Put_Line("From Task A: Message " & Integer'Image(I));
         delay 0.2;  -- 延迟以展示并行执行
      end loop;
      Put_Line("Task A completed.");
   end Task_A;

   task body Task_B is
   begin
      for I in 1..3 loop
         Put_Line("From Task B: Message " & Integer'Image(I));
         delay 0.2;  -- 延迟以展示并行执行
      end loop;
      Put_Line("Task B completed.");
   end Task_B;

   task body Task_C is
   begin
      for I in 1..3 loop
         Put_Line("From Task C: Message " & Integer'Image(I));
         delay 0.2;  -- 延迟以展示并行执行
      end loop;
      Put_Line("Task C completed.");
   end Task_C;

begin
   Put_Line("Main procedure started.");
   delay 1.0;  -- 等待所有任务完成
   Put_Line("Main procedure ended.");
end Parallel_Tasks;