% This script plots a sine wave

x = linspace(0, 4*pi, 1000); % Generate 1000 points from 0 to 4*pi
y = sin(x); % Calculate the sine of x

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2); % Plot with a blue line
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on; % Add a grid for better readability