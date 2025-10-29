% MATLAB script to plot a sine wave
% Clear workspace and command window
clear all;
clc;

% Define x values from 0 to 4*pi with small increments
x = 0:0.01:4*pi;

% Calculate corresponding y values (sine of x)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;

% Add some styling
hold on;
plot(x, zeros(size(x)), 'k--', 'LineWidth', 0.5); % Add x-axis line
hold off;

% Display information about the plot
fprintf('Sine wave plot created with x ranging from 0 to %.2f radians\n', 4*pi);