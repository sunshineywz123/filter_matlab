clc,clear,close all
I=imread('2.bmp');
I=rgb2gray(I);
subplot(1,2,1)
imshow(I)
n=191;
I=adpmedian(I,n);
subplot(1,2,2)
imshow(I)