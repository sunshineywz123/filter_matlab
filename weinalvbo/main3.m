clc,clear,close all
I=imread('lena.jpg');
I=rgb2gray(I);
I = im2double(I);
n=5;
PSF = fspecial('gaussian',n);
blurred = imfilter(I, PSF,'circular');%±ÿ–Î”√circular
%%
sizeI = size(blurred);
H = psf2otf(PSF, sizeI);
F=fft2(blurred);
G=ifft2(F./H);
result1=real(G);

imshow(I),title('original image');
figure,imshow(blurred),title('blurred image');
figure,imshow(result1),title('restored image');