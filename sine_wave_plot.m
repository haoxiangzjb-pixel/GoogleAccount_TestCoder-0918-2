% This script plots a sine wave
x = linspace(0, 2*pi, 1000); % Create 1000 points from 0 to 2*pi
y = sin(x); % Calculate the sine of x

% Plot the sine wave
figure;
plot(x, y);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;