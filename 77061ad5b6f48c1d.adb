with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Parallel_Task_Example is
   -- 定义任务类型
   task type Printer_Task (ID : Integer);
   
   -- 实现任务类型
   task body Printer_Task is
      subtype Message_Range is Integer range 1..5;
      package Random_Messages is new Ada.Numerics.Discrete_Random(Message_Range);
      Generator : Random_Messages.Generator;
      Message_Count : Natural := 5;  -- 每个任务打印5条消息
   begin
      Random_Messages.Reset(Generator);
      
      for I in 1..Message_Count loop
         -- 生成随机延迟，模拟不同任务的执行时间
         delay Duration(Random_Messages.Random(Generator)) * 0.1;
         
         Put_Line("Task " & Integer'Image(ID) & " - Message" & Integer'Image(I));
      end loop;
      
      Put_Line("Task " & Integer'Image(ID) & " completed.");
   end Printer_Task;
   
   -- 创建多个任务实例
   Task1 : Printer_Task(1);
   Task2 : Printer_Task(2);
   Task3 : Printer_Task(3);
   Task4 : Printer_Task(4);
   
begin
   -- 主程序等待所有任务完成
   null;  -- 实际上任务会在程序结束时自动完成
end Parallel_Task_Example;