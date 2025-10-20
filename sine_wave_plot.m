% MATLAB script to plot a sine wave
x = 0:0.01:2*pi;  % Define x values from 0 to 2*pi
y = sin(x);       % Calculate sine values

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');
grid on;