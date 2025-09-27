% This script plots a sine wave

x = linspace(0, 2*pi, 1000); % Create 1000 points from 0 to 2*pi
y = sin(x); % Calculate the sine of x

plot(x, y); % Plot the sine wave
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on; % Add a grid to the plot
