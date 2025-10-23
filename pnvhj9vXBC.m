% MATLAB script to plot a sine wave
% Create x values from 0 to 2*pi
x = linspace(0, 2*pi, 1000);

% Calculate sine values
y = sin(x);

% Plot the sine wave
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;