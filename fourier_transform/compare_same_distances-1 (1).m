% Matches Images with Target Image
clc;
clear;
close all;


FOLDER_NAME = 'NO ORIENTATION';
THRESHOLD = 0.9;
TECHNIQUE = 1; % 1 = pre-determined numbering ; 0 = max val of fourier images.
n=12;


% SHOWS ALL IMAGES IN NO ORIENTATION (TESTING IMAGES) FOLDER 
figure;
for i=(1:n)
    IMAGE_FILENAME = strcat(FOLDER_NAME,'/',int2str(i),'.pgm');
    IMAGE = imread(IMAGE_FILENAME);
    subplot(4,ceil(n/4),i),imshow(IMAGE),title(strcat(int2str(i),'.pgm'));
end



COMPARING_IMAGE_FILENAME = strcat(FOLDER_NAME,'/target.pgm');
COMPARING_IMAGE = imread(COMPARING_IMAGE_FILENAME);
f_original = get_feature_vector(COMPARING_IMAGE,0,THRESHOLD,TECHNIQUE);
%f_original = get_shifted_transform_image(COMPARING_IMAGE,THRESHOLD);

E_DIST = zeros(1,n);

% COMPUTES FEATURE VECTOR FOR EVERY IMAGE AND STORES THEIR EUCLIDEAN
% DISTANCE IN E_DIST

for i=(1:n) 
    IMAGE_FILENAME = strcat(FOLDER_NAME,'/',int2str(i),'.pgm');
    IMAGE = imread(IMAGE_FILENAME);
    %f_image = get_shifted_transform_image(IMAGE,THRESHOLD);
    f_image = get_feature_vector(IMAGE,0,THRESHOLD,TECHNIQUE);
    dist = euclidean_distance(f_original,f_image);
    %dist = euclidean_distance_2d(f_original,f_image);
    E_DIST(1,i) = dist;
end
figure,title('Matched Image');

[~,I] = min(E_DIST(:));

% SHOWS CLOSEST MATCH (MINIMUM DISTANCE)
MATCHED_IMAGE = imread(strcat(FOLDER_NAME,'/',int2str(I),'.pgm'));
subplot(1,2,1),imshow(COMPARING_IMAGE),title('Original Image');
subplot(1,2,2),imshow(MATCHED_IMAGE),title('Matched Image');

%figure;

% SHOWS NEXT CLOSEST MATCH (SECOND MINIMUM DISTANCE)
%E_DIST(I)=[];
%[M,I] = min(E_DIST(:));
%MATCHED_IMAGE = imread(strcat(FOLDER_NAME,'/',int2str(I),'.pgm'));
%subplot(1,2,1),imshow(COMPARING_IMAGE),title('Original Image');
%subplot(1,2,2),imshow(MATCHED_IMAGE),title('Matched Image');
