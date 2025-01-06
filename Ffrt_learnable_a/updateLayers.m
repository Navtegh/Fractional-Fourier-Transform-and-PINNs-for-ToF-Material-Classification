function dlnet = updatealpha(dlnet, alpha)
    % Update network layers with new learnables and alpha
    newLayers = dlnet.Layers;

    for i = 1:numel(newLayers)
        if isa(newLayers(i), 'FrFTLayer')
            newLayers(i).Alpha = alpha;
        end
    end

    dlnet = dlnetwork(newLayers);
end