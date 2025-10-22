with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Tasks is
   package Random_Int is new Ada.Numerics.Discrete_Random(Integer);
   use Random_Int;
   
   Gen : Generator;

   task type Worker_Task;
   task body Worker_Task is
      Local_ID : Integer;
      Delay_Time : Integer;
   begin
      Local_ID := Integer'Value(Worker_Task'Image(Worker_Task'Identity));
      for I in 1..5 loop
         Delay_Time := Random(Gen) mod 3 + 1; -- 随机延迟1-3秒
         delay Duration(Delay_Time);
         Put_Line("Task " & Integer'Image(Local_ID) & " - Message " & Integer'Image(I));
      end loop;
   end Worker_Task;

   Task_1 : Worker_Task;
   Task_2 : Worker_Task;
   Task_3 : Worker_Task;

begin
   Reset(Gen); -- 初始化随机数生成器
   Put_Line("Starting parallel tasks...");
   delay 20.0; -- 等待所有任务完成
   Put_Line("All tasks completed.");
end Parallel_Tasks;