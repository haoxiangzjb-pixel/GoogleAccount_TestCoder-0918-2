`timescale 1ns / 1ps

module tb_d_flip_flop;

  // Объявление сигналов
  reg clk;
  reg reset;
  reg d;
  wire q;

  // Инстанс тестируемого модуля (предполагается, что он называется d_flip_flop)
  d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Генерация тактового сигнала (период 10 нс)
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Инвертировать clk каждые 5 нс (период = 10 нс)
  end

  // Процесс тестирования
  initial begin
    // Открытие VCD файла для трассировки
    $dumpfile("tb_d_flip_flop.vcd");
    $dumpvars(0, tb_d_flip_flop);

    // Инициализация сигналов
    reset = 1;
    d = 0;
    #10; // Ждем 10 нс

    reset = 0; // Сброс released
    #5;

    // Тестирование
    d = 1; // Установить D в 1
    #10;   // Ждать следующего такта
    d = 0; // Установить D в 0
    #10;
    d = 1; // Установить D в 1
    #10;
    d = 0; // Установить D в 0
    #10;

    // Завершение симуляции
    $finish;
  end

endmodule
