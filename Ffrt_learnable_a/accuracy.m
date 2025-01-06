function [acc, Ypreds] = accuracy(network, x_data, y_data)

    Ypreds = classify(network, x_data);
    Ytest = y_data;   
    acc = ceil(100*sum(Ypreds == Ytest)/numel(Ytest));

end