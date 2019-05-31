clc,clear,close all
I=imread('01.bmp');
I_gray=rgb2gray(I);
% imshow(I_gray)
%%
I_dct=dct2(I_gray);
% imshow(log(abs(I_dct)),[])
% colormap(gray(4))
% colorbar
% message = 'yuantu piinpu';
% text(30,30,message,'Color','r','FontWeight','bold');
%%
g=uint8(abs(I_dct));
hist=histcount(g);
c=0:255;
plot(c,hist)
title('f-hist')
%%
I_idct=idct2(I_dct)/255;
% imshow(I_idct)
%%
N=imnoise(I_gray,'Gaussian');
% imshow(N)
%%
N_dct=dct2(N);
% imshow(log(abs(N_dct)),[])
% colormap(gray(4))
% colorbar
% message = 'noise piinpu';
% text(30,30,message,'Color','b','FontWeight','bold');
%%
% N_dct(abs(N_dct)>40)=0;
% imshow(log(abs(N_dct)),[])
% colormap(gray(4))
% colorbar
% message = 'noise-lvbo piinpu2';
% text(30,30,message,'Color','y','FontWeight','bold');
%%
g=uint8(abs(N_dct));
% hist=histcount(g);
% c=0:255;
% plot(c,hist)
% title('f-noise-hist')
%%
N_idct=idct2(N_dct)/255;
% imshow(N_idct)
% message = 'noise-lvbo1';
% text(30,30,message,'Color','y','FontWeight','bold');