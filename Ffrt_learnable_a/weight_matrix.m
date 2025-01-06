function weighted_mat = weight_matrix(window_rows, window_colms)

    window_rows_centre = ceil(window_rows/2);
    window_colms_centre = ceil(window_colms/2);

    weighted_mat = zeros(window_rows, window_colms);
    eq_dist_mat = zeros(window_rows, window_colms);
    for n = 1: window_rows
        for m = 1: window_colms
           [weighted_mat(n,m), eq_dist_mat(n,m)] = deal(sqrt((n-window_rows_centre)^2 + (m-window_colms_centre)^2));
        end
    end

    uniq_dist = unique(eq_dist_mat);
    weights = linspace(1, 0.1, numel(uniq_dist));

    for i = 1:numel(weights)
        weighted_mat(eq_dist_mat == uniq_dist(i)) = weights(i);
    end

end