function [sigma_R_Sqr, d_new, G] = sigma_R_Square(Images)

    disp("Start")
    centreR = ceil(size(Images,1)/2);
    centreC = ceil(size(Images,2)/2);

    imge = cell(size(Images, 5), 1);
    for n = 1: size(Images, 5)

        img = cell(size(Images,1), size(Images,2));
        for i = 1:size(Images,1)
           for j = 1: size(Images,2)
        
               image = Images(i,j,:,:, n) - Images(centreR, centreC, :, :, n);
               img{i,j} = norm(cat(1, image(:)));
        
           end
        end
        imge{n} = vertcat(img{:});

    end
    distances = vertcat(imge{:});
    d_new = sortrows(distances);
    d_end = d_new(end);

    sigma_R_Sqr = (- d_end/(2*log(0.95)));
    G = exp(- d_new./(2*sigma_R_Sqr));

    disp("Finished");

end