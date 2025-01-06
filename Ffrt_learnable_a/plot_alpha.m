figure;
hold on; % Allows multiple plots on the same graph

plot(abc, maxacc5, '-o', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', '5 Material');
plot(abc, maxacc12, '-s', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', '12 Material');
plot(abc, maxacc14, '-^', 'LineWidth', 2, 'MarkerSize', 6, 'DisplayName', '14 Material');

grid on;

% Add labels and title
xlabel('Alpha Values');
ylabel('Accuracy');
title('Accuracy vs Alpha Values for Different Models');

% Add legend
legend show;

hold off; % Release the hold on the current figure