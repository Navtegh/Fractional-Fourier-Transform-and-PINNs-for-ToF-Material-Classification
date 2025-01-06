% Extract frequencies and real and imaginary components

frequencies = linspace(20e6, 160e6, 8);  % Temporal frequencies from 20 MHz to 160 MHz
real_values = zeros([1 8]);
imaginary_values = zeros([1 8]);
abs = zeros([1 8]);
for idx = 1:8
         real_values(1,idx)= output_matrix(5,1,30,40,idx,1);
         imaginary_values(1,idx) = output_matrix(5,1,30,40,idx,2);
         abs(1,idx)=sqrt(output_matrix(5,1,30,40,idx,1)^2 + output_matrix(5,1,30,40,idx,2)^2);
end


% Plot real values
figure;
plot(frequencies, real_values, 'b.-', 'LineWidth', 2);
hold on;
% Plot imaginary values
plot(frequencies, imaginary_values, 'r.-', 'LineWidth', 1.5);
hold on;
plot(frequencies, abs, 'g.-', 'LineWidth', 1.5);
hold off;

% Add labels and title
xlabel('Frequency (Hz)');
ylabel('Data Value');
title('Real and Imaginary Values vs. Frequency');
legend('Real', 'Imaginary', 'abs');
grid on;