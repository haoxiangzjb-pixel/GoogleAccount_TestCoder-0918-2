% Generate time vector
t = linspace(0, 2*pi, 1000);

% Generate sine wave
y = sin(t);

% Plot the sine wave
figure;
plot(t, y);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Wave');
grid on;

% Save the plot as an image
saveas(gcf, 'sine_wave.png');

fprintf('Sine wave plot saved to sine_wave.png\n');