`timescale 1ns / 1ps

module tb_dff();

    // Объявление сигналов
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Инициализация D-триггера (предполагается, что модуль dff уже существует)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Генерация тактового сигнала
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Тактовый период 10
    end

    // Сброс и тестирование
    initial begin
        // Инициализация сигналов
        rst_n = 0;
        d = 0;
        #10; // Ждем 10 нс
        rst_n = 1; // Сброс завершен
        #10;
        d = 1; // Подаем 1 на D
        #20;
        d = 0; // Подаем 0 на D
        #20;
        d = 1; // Подаем 1 на D
        #20;
        $finish; // Завершаем симуляцию
    end

endmodule