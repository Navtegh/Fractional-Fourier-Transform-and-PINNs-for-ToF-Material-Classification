function [gradients,alphaGrad]=compute_gradient(dlnet,loss,alpha)
    
    gradients= dlgradient(dlarray(loss),dlnet.Learnables);%automatic gradient
    % disp(dlnet.Learnables.Value{strcmp(dlnet.Learnables.Parameter, 'Alpha')});
    disp(gradients);
    alphaGrad = dlgradient(loss, dlnet.Learnables.Value{strcmp(dlnet.Learnables.Parameter, 'Alpha')});
end