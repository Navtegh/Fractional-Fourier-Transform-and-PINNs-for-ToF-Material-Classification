function [Z, state] = forwar(dlnet, X, alpha)
    % Perform forward pass through the network
    if ~isa(X, 'dlarray')
       X = dlarray(X);
    end
    Z = predict(dlnet, X);
    state = struct();
    state.Learnables = dlnet.Learnables;
    disp('hello');
end
