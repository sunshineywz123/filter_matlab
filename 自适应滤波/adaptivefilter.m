clc;
clear;
close all;
RGB = imread('3.bmp');
% I = rgb2gray(RGB);
I=RGB;
% imshow(I,[])
%%
% J = imnoise(I,'gaussian',0,0.005);
% imshow(J)
% title('J-noise')
% J = im2double(J);
%%
n=5;
K = mywiener2(double(I),[n,n]);
%%
imshow(K,[])
title('adaptive filter')