% This function provides the k nearest neighbour from the window based on
% intensity metric

function knn_images = knn(images, raw_images, k)
    
    centreR = ceil(size(images,1)/2);
    centreC = ceil(size(images,2)/2);
    
    %knn_image = cell(size(images, 5), 1);
    %for n = 1: size(images, 5)
    
    r = repmat([1:size(images,1)]', 1, size(images,2));
    r = r(:);
    c = repmat([1:size(images,2)], size(images,1), 1);
    c = c(:);
    
    knn_image = cell(size(images, 5), 1);
    for n = 1: size(images, 5)

        b_image = images(:,:,:,:,n) - repmat(images(centreR, centreC, :, :, n), size(images,1), size(images,2));
  
        b_image = reshape(b_image, [ 5, 5, 2]);
        b_image = vecnorm(b_image, 2, 3);
        b_image = [b_image(:) r c];
        
        image_norm_value = sortrows(b_image, 1);
        i = image_norm_value(1:k,2);
        j = image_norm_value(1:k,3);
        
         x = cell(1, k); % extracting top k nearest 3D-pixels
         for image_norm_value = 1:k
             x{1,image_norm_value} = raw_images(i(image_norm_value), j(image_norm_value), :, :, n);
         end
        knn_image{n} = horzcat(x{:});

    end
    knn_images = cat(5, knn_image{:});
    %knn_images = cat(4, knn_image{:});

end