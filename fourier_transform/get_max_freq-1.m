function FINAL=get_max_freq(I,thresh,teck)
% accepts the I (full fourier transform image with shifted to center)

%trans_image = get_shifted_transform_image(I);

trans_image=I;
trans_image(trans_image<thresh)=0;


% adapting to the figure 2(c) numbering

if teck==1 % technique 1 : select figure 2(c) ordering from quarter fourier image.
    feature_vector = zeros(1,11);
    feature_vector(1) = trans_image(1,1);
    feature_vector(2) = trans_image(1,2);
    feature_vector(3) = trans_image(2,1); 
    feature_vector(4) = trans_image(1,3); 
    feature_vector(5) = trans_image(2,2); 
    feature_vector(6) = trans_image(3,1); 
    feature_vector(7) = trans_image(1,4); 
    feature_vector(8) = trans_image(2,3); 
    feature_vector(9) = trans_image(3,2); 
    feature_vector(10) = trans_image(4,1); 
    feature_vector(11) = trans_image(1,5); 
else
   [Val,Ind] = max(trans_image(:));
   feature_vector = Val;
end

FINAL = feature_vector;

end