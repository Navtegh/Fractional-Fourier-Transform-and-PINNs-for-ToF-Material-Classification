function [normal_parameter, weibull_parameter, gamma_parameter, lognormal_parameter, kernel_parameter] = plot_histogram(data, mat_num, temp_freq_num)
% Create Vector

disp([mat_num, temp_freq_num])

    hh_normal = histfit(data, [], 'normal');
   
    xbar1 = hh_normal(1).XData;
    xbar1 = xbar1 - mean(xbar1);
    ybar = hh_normal(1).YData;
    ybar1 = ybar/sum(ybar);
    
    xbar_prob1 = hh_normal(2).XData;
    xbar_prob1 = xbar_prob1 - mean(xbar_prob1);
    ybar_prob1 = hh_normal(2).YData;
    ybar_prob1 = ybar_prob1/sum(ybar_prob1);
    
    close all


    hh_weibull = histfit(data, [], 'weibull');
    
    xbar_prob2 = hh_weibull(2).XData;
    xbar_prob2 = xbar_prob2 - mean(xbar_prob2);
    ybar_prob2 = hh_weibull(2).YData;
    ybar_prob2 = ybar_prob2/sum(ybar_prob2);

    close all

    hh_gamma = histfit(data, [], 'gamma');

    xbar_prob3 = hh_gamma(2).XData;
    xbar_prob3 = xbar_prob3 - mean(xbar_prob3);
    ybar_prob3 = hh_gamma(2).YData;
    ybar_prob3 = ybar_prob3/sum(ybar_prob3);

    close all
 
    hh_lognormal = histfit(data, [], 'lognormal');

    xbar_prob4 = hh_lognormal(2).XData;
    xbar_prob4 = xbar_prob4 - mean(xbar_prob4);
    ybar_prob4 = hh_lognormal(2).YData;
    ybar_prob4 = ybar_prob4/sum(ybar_prob4);

    close all

    hh_kernel = histfit(data, [], 'kernel');

    xbar_prob5 = hh_kernel(2).XData;
    xbar_prob5 = xbar_prob5 - mean(xbar_prob5);
    ybar_prob5 = hh_kernel(2).YData;
    ybar_prob5 = ybar_prob5/sum(ybar_prob5);

    close all

    figure
    hold on
    xticks([])
    yticks([])
    axis square

    bar(xbar1, ybar1, 'BarWidth' ,1)               % plot histogram Probability
    plot(xbar_prob1, ybar_prob1, 'g' , 'LineWidth' ,2, 'LineStyle','-.')
    plot(xbar_prob2, ybar_prob2, 'r' , 'LineWidth' ,2, 'LineStyle','-')
    plot(xbar_prob3, ybar_prob3, 'k' , 'LineWidth' ,2, 'LineStyle','--')
    plot(xbar_prob4, ybar_prob4, 'y' , 'LineWidth' ,2, 'LineStyle',':')
    plot(xbar_prob5, ybar_prob5, 'm' , 'LineWidth' ,2, 'LineStyle','--')

    hold off
    set(gca,'Visible','off')
    exportgraphics(gcf, append('data_dist', '_mat_num', string(mat_num), '_temporal_freq_num', string(temp_freq_num), '.pdf'), 'resolution', 600)
    saveas(gcf, append('data_dist_14', '_mat_num', string(mat_num), '_temporal_freq_num', string(temp_freq_num)), 'm')
    
    normal_parameter = fitdist(data, 'normal');
    weibull_parameter = fitdist(data, 'weibull');
    gamma_parameter = fitdist(data, 'gamma');
    lognormal_parameter = fitdist(data, 'lognormal');
    kernel_parameter = fitdist(data, 'kernel');
    
    disp(fitdist(data, 'normal'));
    disp(fitdist(data, 'weibull'));
    disp(fitdist(data, 'gamma'));
    disp(fitdist(data, 'lognormal'));
    disp(fitdist(data, 'kernel'));

end