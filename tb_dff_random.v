`include "DFF.v" // Предполагаем, что файл с D-триггером называется DFF.v

module DFF_testbench;
    reg clk;
    reg reset_n;
    reg d;
    wire q, q_bar;

    DFF uut (
        .clk(clk),
        .reset_n(reset_n),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Генерация тактового сигнала с периодом 10
    end

    initial begin
        $dumpfile("DFF_testbench.vcd");
        $dumpvars(0, DFF_testbench);
    end

    initial begin
        // Инициализация
        reset_n = 0;
        d = 0;
        #10;

        // Снятие сигнала сброса
        reset_n = 1;
        #10;

        // Тестирование
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        $finish;
    end

endmodule