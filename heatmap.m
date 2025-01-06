% %amplitude_values = amp_imgs{5,50}(:,:); % assuming values range from 0 to 255
% real_data=real(dataset{3,1}(:,:,8));
% imag_data=imag(dataset{3,1}(:,:,8));
% 
% amplitude = sqrt(real_data.^2 + imag_data.^2);
% phase = atan2(imag_data, real_data);


%amplitude_values = real(dataset{1,1}(:,:,9));
amplitude_values = real(amp_imgs{1,1});
% Create a figure
figure;

% Generate the heat map
imagesc(amplitude_values);

% Add a colorbar for reference
colorbar;

% Add a title and axis labels
title('ToF Sensor Heatmap');
xlabel('Column');
ylabel('Row');