clc; clear;
%pim-preprocessed image

%% read image
[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);

%preprocessing
image=preprocessing(im);

