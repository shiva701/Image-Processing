%%//Read in image
clear all;
close all;
[imname,impath]=uigetfile({'*.jpg;*.png'});
Ireal = imread([impath,'/',imname]); %//Real
image(Ireal);
hsvImageReal = rgb2hsv(Ireal);
%hsvImageFake = rgb2hsv(Ifake);
figure;
imshow([hsvImageReal(:,:,1) hsvImageReal(:,:,2) hsvImageReal(:,:,3)]);
title('Real');
%figure;
%imshow([hsvImageFake(:,:,1) hsvImageFake(:,:,2) hsvImageFake(:,:,3)]);
%title('Fake');
%%//Initial segmentation
croppedImageReal = hsvImageReal(:,295:300,:);
imshow(croppedImageReal);