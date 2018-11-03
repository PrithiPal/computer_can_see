
function FINAL=get_feature_vector(I,sho,thresh,teck) 
% INPUT is image I, sho=1(show images)?=0(don't show images)

    current_image = I;
    transformed_image = get_shifted_transform_image(current_image);
    
    if sho == 1
        figure;
        subplot(1,2,1),imshow(current_image),title('Original Image');
        subplot(1,2,2),imshow(transformed_image),title('Quarter fourier');
       
    end
    feature_vector = get_max_freq(transformed_image,thresh,teck);
    
    FINAL = feature_vector;
    
end


