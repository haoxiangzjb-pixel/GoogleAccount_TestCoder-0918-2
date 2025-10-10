% This script plots a sine wave
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;