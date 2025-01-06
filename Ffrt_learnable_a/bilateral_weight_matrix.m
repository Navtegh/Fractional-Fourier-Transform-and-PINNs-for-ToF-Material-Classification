%{

~ bilateral_weight_matrix

Desciption: This function updates all the pixels inside the window using a
bilateral weight matrix.
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function b_matrix = bilateral_weight_matrix(image, sigmaD, sigmaR)
    
    centreR = ceil(size(image,1)/2);
    centreC = ceil(size(image,2)/2);
    
    % Generate data for spatial weight matrix
    
    % row & col
    
    r = repmat([1:size(image,1)]', 1, size(image,2));
    c = repmat([1:size(image,2)], size(image,1), 1);
    
    r = r - centreR;
    c = c - centreC;
    
    r = r.^2;
    c = c.^2;
    
    % Generate dist matrix
    
    dist = sqrt(r+c);
    
    % Generate range matrix
    
    b_image = image - repmat(image(centreR,centreC, :, :), size(image,1), size(image,2));
    b_image = (b_image.^2)./(2*sigmaR.^2);
    b_matrix = sum(b_image, 3);
    
    % Generate bilateral weight matrix
    
    b_matrix = exp(-(dist./(2*sigmaD.^2)) - b_matrix);
    %b_matrix = repmat(b_matrix, 1, 1, 8, 1);
             
end