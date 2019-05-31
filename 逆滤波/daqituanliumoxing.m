clc,clear,close all
I=imread('lena.jpg');

% imshow(I);
I_gray=rgb2gray(I);
% imshow(I_gray)


%%
[row,col]=size(I_gray);
M=2*row-1;
N=2*col-1;
%%
I_gray=double(I_gray);
%%
F=fft2(I_gray,M,N);
% imshow(log(abs(fftshift(F))),[])
% title('in-zs')
%%
[U,V]=dftuv(M,N);
k=0.001;
p=-k*(U.^2+V.^2).^(5/6);
H=exp(p);
% mesh(fftshift(H(1:10:M,1:10:N)))
% colormap([1,1,1])
% imshow(uint8(fftshift(H)),[])
%%
F_out=H.*F;
% imshow(log(abs(F)),[])
% title('in-zs')
%%
G=ifft2(F_out);
G=abs(G);
G=G(1:row,1:col);
G_out=(G-min(min(G)))*255/(max(max(G))-min(min(G)));
% imwrite(uint8(G),'1.bmp','bmp');
imshow(G_out,[0,255])
title('ifft2')

