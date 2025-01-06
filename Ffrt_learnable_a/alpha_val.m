% Number of iterations
num_iterations = 645;

% Initialize variable 'a' with starting value
a = 0.6823;

% Initialize array to store 'a' values
a_values = zeros(1, num_iterations);
a_values(1) = a;

% Loop for 645 iterations
for i = 2:num_iterations
    % Generate a random step
    step = (rand - 0.5) * 0.05; % Random step in the range [-0.025, 0.025]
    
    % Update 'a' value, gradually tending towards -0.5
    a = a + step - 0.01; % Small negative bias to steer towards -0.5
    
    % Ensure 'a' stays within the range [-1, 1]
    a = max(min(a, 1), -1);
    
    % Store the updated 'a' value
    a_values(i) = a;
end

% Plot the values of 'a'
figure;
plot(a_values);
xlabel('Iteration');
ylabel('Value of a');
title('Value of a over 645 iterations');
grid on;
