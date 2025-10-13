% This MATLAB script plots a sine wave

% Define the x-axis values
x = linspace(0, 4*pi, 1000); % 1000 points from 0 to 4*pi

% Calculate the y-axis values (sine of x)
y = sin(x);

% Create the plot
figure; % Open a new figure window
plot(x, y, 'b-', 'LineWidth', 2); % Plot y vs x with a blue line

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of a Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Add horizontal lines at y = 1 and y = -1
hold on;
plot(x, ones(size(x)), 'k--'); % Dashed line at y = 1
plot(x, -ones(size(x)), 'k--'); % Dashed line at y = -1
hold off;

% Optional: Save the figure as an image
% saveas(gcf, 'sine_wave_plot.png'); % Uncomment to save the plot