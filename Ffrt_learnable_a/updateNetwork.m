function state = updateNetwork(state, gradients, learnRate)
    % Update the network parameters based on the gradients and learning rate
    for i = 1:height(state.Learnables)
        % Extract the parameter value and the corresponding gradient
        paramValue = state.Learnables.Value{i};
        % disp(paramValue);
        gradientValue = gradients.Value{i};
        disp(gradientValue);
        % Update the parameter value
        state.Learnables.Value{i} = paramValue - learnRate * gradientValue;
    end
end