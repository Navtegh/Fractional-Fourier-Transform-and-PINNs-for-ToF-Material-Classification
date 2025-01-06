function param = sgdUpdate(param, grad, learnRate)
    param = param - learnRate * grad;
end