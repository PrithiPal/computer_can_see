function FINAL=get_shifted_transform_image(I)
% ACCEPTS NORMAL IMAGE I, returns transformed shifted image; Threshold = [0,1]
    current_image = I;
    
    f = fft2(current_image);
    
    fa = imag(f);
    %fa = log(fa);
    fa = fa - min(fa(:));
    fa = fa/max(fa(:));
    
    fsa = fftshift(fa);
    
    x = size(f,1);
    y = size(f,2);
    
    fsa = fsa(x/2:x,y/2:y);
    
   
    
    FINAL=fsa;
end