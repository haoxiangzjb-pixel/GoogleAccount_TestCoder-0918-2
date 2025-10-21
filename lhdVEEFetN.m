% MATLAB script to plot a sine wave
% This script generates and plots a sine wave

% Define the x-axis values
x = linspace(0, 4*pi, 1000);  % From 0 to 4π with 1000 points

% Calculate the sine wave values
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;

% Optional: Add some styling
xlim([0 4*pi]);