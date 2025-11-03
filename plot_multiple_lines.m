% MATLAB script to plot multiple lines and save to a file with a random name

% Generate some sample data for multiple lines
x = 0:0.1:10;
y1 = sin(x);
y2 = cos(x);
y3 = sin(x).*exp(-x/5);

% Create the plot with multiple lines
figure;
plot(x, y1, 'r-', 'LineWidth', 2); hold on;
plot(x, y2, 'b--', 'LineWidth', 2);
plot(x, y3, 'g:', 'LineWidth', 2);
xlabel('X axis');
ylabel('Y axis');
title('Multiple Lines Plot');
legend('sin(x)', 'cos(x)', 'sin(x)*exp(-x/5)');
grid on;

% Generate a random filename
random_name = ['plot_' num2str(randi(9999)) '.png'];

% Save the figure with the random filename
saveas(gcf, random_name);

fprintf('Plot saved as %s\n', random_name);