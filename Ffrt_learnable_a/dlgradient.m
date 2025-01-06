function [gradients, alphaGrad] = dlgradient(loss, learnables, alpha)
    % Compute the gradients with respect to the network learnables and alpha
    gradients = dlgradient(loss, learnables);
    alphaGrad = dlgradient(loss, alpha);
end
