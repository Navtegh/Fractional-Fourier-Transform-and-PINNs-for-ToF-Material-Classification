
gray_image=amplitude1;
% Extract GLCM features
offsets = [0 1; -1 1; -1 0; -1 -1];  % Specify offsets for computing GLCM
glcm = graycomatrix(gray_image, 'Offset', offsets);
stats = graycoprops(glcm, {'Contrast', 'Correlation', 'Energy', 'Homogeneity'});

% Extract LBP features
numPoints = 24;
radius = 3;
lbp_features = extractLBPFeatures(gray_image, 'NumNeighbors', numPoints, 'Radius', radius, 'Upright', false);

% Display extracted features
disp('GLCM Features:');
disp(stats);
disp('LBP Features:');
disp(lbp_features);