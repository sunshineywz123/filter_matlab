clc,clear,close all
I=imread('lena.jpg');
I=rgb2gray(I);
I = im2double(I);
len=100;
theta=10;
PSF = fspecial('motion',len,theta);
blurred = imfilter(I, PSF,'circular');%±ÿ–Î”√circular

result1 = mydeconvwnr(blurred, PSF, 0);

% imshow(I),title('original image');
% figure,imshow(blurred),title('blurred image');
% figure,imshow(result1),title('restored image');
%%
noise_mean = 0;
noise_var = 0.0001;
blurred_noisy = imnoise(blurred, 'gaussian', noise_mean, noise_var);

% imshow(blurred_noisy ),title('blurred image with noise');
%%
estimated_nsr =0.001;
result2 = mydeconvwnr(blurred_noisy, PSF, estimated_nsr);
% imshow(result2)
% title('restored image with estimated nsr(1)');
%%
estimated_nsr = noise_var/var(I(:));
result3 = mydeconvwnr(blurred_noisy, PSF, estimated_nsr);
imshow(result3)
title('restored image with estimated nsr(2)');