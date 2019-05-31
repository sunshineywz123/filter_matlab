clc,clear,close all
I=imread('lena.jpg');
I=rgb2gray(I);
I = im2double(I);
len=100;
theta=10;
PSF = fspecial('motion',len,theta);
blurred = imfilter(I, PSF,'circular');%±ÿ–Î”√circular

result1 = mydeconvwnr(blurred, PSF, 0);

imshow(I),title('original image');
figure,imshow(blurred),title('blurred image');
figure,imshow(result1),title('restored image');