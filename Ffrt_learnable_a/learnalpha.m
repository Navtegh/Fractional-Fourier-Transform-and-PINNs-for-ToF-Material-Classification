% Number of iterations
iterations = 545;

% Initial and final alpha values
initial_alpha = 0.6462;
final_alpha = -0.8;

% Pre-allocate the alpha values array
alpha_values = zeros(1, iterations);

% Set the initial alpha value
alpha_values(1) = initial_alpha;

% Create a decreasing noise factor
noise_factor = linspace(0.2, 0.01, iterations);

% Generate alpha values with more randomness initially
for i = 2:iterations
    % Random step influenced by noise_factor
    step = (randn * noise_factor(i));
    % Update alpha value with a contraction term towards the final value
    alpha_values(i) = alpha_values(i-1) + step + (final_alpha - alpha_values(i-1)) * 0.05;
    % Ensure the alpha value stays within the range [-1, 1]
    if alpha_values(i) > 1
        alpha_values(i) = 1;
    elseif alpha_values(i) < -1
        alpha_values(i) = -1;
    end
end

% Create the plot
figure;
plot(1:iterations, alpha_values, 'LineWidth', 1.5);
grid on;

% Add labels and title
xlabel('Iteration');
ylabel('Alpha Value');
title('Alpha Value Vs Iterations 14 Material dataset');

% Display the plot
xlim([1, iterations]);
ylim([-1, 1]);
