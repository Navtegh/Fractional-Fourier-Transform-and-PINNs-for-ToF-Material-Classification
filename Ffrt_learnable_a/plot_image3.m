%{

~ plot_image1

Desciption: To plot artificial image
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function plot_image3(image_cat, mat_list_names)

    image = zeros(size(image_cat));
    for i = 1:numel(mat_list_names)
        image(image_cat == mat_list_names{i,1}) = i;
    end

    imagesc(image);

    h = findobj(gcf,'type','image');
    xdata = get(h, 'XData');
    ydata = get(h, 'YData');
    M = size(get(h,'CData'), 1);
    N = size(get(h,'CData'), 2);

    if M > 1
        pixel_height = diff(ydata) / (M-1);
    else
        % Special case. Assume unit height.
        pixel_height = 1;
    end
    
    if N > 1
        pixel_width = diff(xdata) / (N-1);
    else
        % Special case. Assume unit width.
        pixel_width = 1;
    end
    
    y_top = ydata(1) - (pixel_height/2);
    y_bottom = ydata(2) + (pixel_height/2);
    y = linspace(y_top, y_bottom, M+1);

    x_left = xdata(1) - (pixel_width/2);
    x_right = xdata(2) + (pixel_width/2);
    x = linspace(x_left, x_right, N+1);

    xv = zeros(1, 2*numel(x));
    xv(1:2:end) = x;
    xv(2:2:end) = x;
    
    yv = repmat([y(1) ; y(end)], 1, numel(x));
    yv(:,2:2:end) = flipud(yv(:,2:2:end));
    
    xv = xv(:);
    yv = yv(:);
    
    yh = zeros(1, 2*numel(y));
    yh(1:2:end) = y;
    yh(2:2:end) = y;
    
    xh = repmat([x(1) ; x(end)], 1, numel(y));
    xh(:,2:2:end) = flipud(xh(:,2:2:end));
    
    xh = xh(:);
    yh = yh(:);

    box = [0.5 0.5; 0.5 40.5; 40.5 40.5; 40.5 0.5; 0.5 0.5];
    
    a = [0.5 20.5; 40.5 20.5];

    b = [14.5 0.5; 14.5 20.5];
    c = [26.5 0.5; 26.5 20.5];
    d = [20.5 20.5; 20.5 40.5];

    h = imagesc(image);
    colorbar('Ticks', unique(image), ...
        'TickLabels', mat_list_names{:,1}, 'FontAngle', 'normal', ...
        'FontSize', 11, 'FontWeight', 'bold', 'FontName', 'Times New Roman', 'Location', 'westoutside')
    
    colormap([1 1 0; 0 1 1; 1 0 0; 0 1 0; 0 0 1])

    xticks([])
    yticks([])
    %{

    xticklabels({'pixel = 1','pixel = 14','pixel = 20', 'pixel = 26', 'pixel = 40'})
    yticklabels({'pixel = 1', 'pixel = 20', 'pixel = 40'})
%}
    ax = ancestor(h, 'axes');
    %{
    line('Parent', ax, 'XData', xh, 'YData', yh, ...
        'Color', 'k', 'LineWidth', 0.1,'LineStyle', ':', 'Clipping', 'off');
    line('Parent', ax, 'XData', xv, 'YData', yv, ...
        'Color', 'k', 'LineWidth', 0.1,'LineStyle', ':', 'Clipping', 'off');
    %}

    line('Parent', ax, 'XData', box(:,1), 'YData', box(:,2), ...
        'Color', 'k', 'LineWidth', 2, 'Clipping', 'off');
    line('Parent', ax, 'XData',a(:,1) , 'YData', a(:,2), ...
        'Color', 'k', 'LineWidth', 2, 'Clipping', 'off');
    line('Parent', ax, 'XData',b(:,1), 'YData', b(:,2), ...
        'Color', 'k', 'LineWidth', 2, 'Clipping', 'off');
    line('Parent', ax, 'XData', c(:,1), 'YData', c(:,2), ...
        'Color', 'k', 'LineWidth', 2, 'Clipping', 'off');
    line('Parent', ax, 'XData', d(:,1), 'YData', d(:,2), ...
        'Color', 'k', 'LineWidth', 2, 'Clipping', 'off');

end