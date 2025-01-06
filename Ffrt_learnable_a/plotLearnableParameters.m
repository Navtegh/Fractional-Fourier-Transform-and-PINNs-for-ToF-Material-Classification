function stop = plotLearnableParameters(info,state)
    stop = false; % Optionally, you can stop the training by setting this to true

    % Access the learnable parameters
    persistent plotHandle; % Store the plot handle to update the same plot

    if info.State == "start"
        % Initialize plot on training start
        figure;
        plotHandle = plot(0, 0);
        xlabel('Iteration');
        ylabel('Parameter Value');
        title('Learnable Parameter Values During Training');
    elseif info.State == "iteration"
        % Update plot every iteration
        iter = info.Iteration;
        
        % Get the parameters you want to plot (e.g., the weights of the first layer)
        weights = extractdata(state.Network.Layers(2).Alpha);

        % Update the plot
        set(plotHandle, 'XData', [get(plotHandle, 'XData') iter]);
        set(plotHandle, 'YData', [get(plotHandle, 'YData') weights(:)']);
        drawnow;
    end
end