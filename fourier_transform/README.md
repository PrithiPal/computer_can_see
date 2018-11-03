## Conventions

The Facial Recognition using the Fourier transformation method has following big steps : 
Functions used
•	**Get_feature_vector(image)** : returns a feature vector of dimension size(image,2). This is the most critical of all steps.
•	**Euclidean_distance(feature_vector_1,feature_vector_2)** : Returns a single integer that denotes the Euclidean distance. 
•	**Main** : combines all functions and demonstrates the matching an image. 

## General Workflow
0.	Make a directory with ‘TEST IMAGES’ and put ‘target.pgm’ and then 1.pgm,2.pgm and so on. Remember to put same image as target.pgm with i.pgm also and that should be our answer. i.pgm could be exact target.pgm or different orientation of target.pgm.
1.	Obtaining frequency domain of the image
2.	Carve out the lower quadrant
3.	Compute the feature vector is this image using get_feature_vector(Image) which returns a [1,n] vector
4.	Make a directory and store combination of image such as different faces, same face or same face different orientation.
5.	Run the loop through all these picture, compute their feature vectors and Euclidean distance between using Euclidean_distance(fv1,fv2) where fvi has size [1,n].
6.	Set a threshold and choose photos which have distances less than the Euclidean distances.

## Approach 1 
get_feature_vector : calculate frequency domain( fftshift(fft(image))), find var and treat var as a feature vector 
**Result** : Failed
**Reason** : Does not makes sense. Also the research paper did not explained this way. 

## Approach 2 
Get_feature_vector : Calculate imaginary domain using x= imag(fftshift(fft(image))), freq  = fs/lengh with fs=1000, pick top frequencies freq(I) where I comes from max(x).
**Result** : Good with same orientation but fails with different orientation.
**Reason** : Probably the selection of frequencies is not optimal. When I seeked helped from Rakesh over my implementation of determining frequencies which looks like follows. 

freq = fs/ 2 : fs/size(f,1); % fs = 1000 and f is the fourier transformed  image.
[~,m] = max (fa_img); % where fa_img is the fourier transformed lower quarter image.
ffreq = freq(m)  = feature_vector % assigns my feature vector

#  Approach 3 (Most Accurate results so far.)

 Made two more functions : **get_shifted_transform_image** and **get_max_freq** which is essentially get_feature_vector divided into two sub-modules. **Get_shifted_transform_image** outputs the transformed image while get_max_freq has logic to compile feature vector.
**For frequency determination**, I am just taking max(transformed_image) and get 1[,47] where 47=totalcols/2 matrix. 

## Approach 4 
Choosen numbering as given in the paper to form feature_vector. That means feature_vector(1) = (1,1), feature_vector(2) = (1,2) .. feature_vector(11) = (1,5) and so on..
To still check whether this approach works, I have created a flag TECHNIQUE where 1 means use pre-determined numbers or 0 means do as usual with feature vector being max Fourier values.
Results : Still doesn’t recognizes the person with different orientation. 


