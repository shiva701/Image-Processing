%%//Read in image
%[imname,impath]=uigetfile({'*.jpg;*.png'});
%Ireal = imread([impath,'/',imname]); %//Real
function ihsv=imageHSV(Ireal);
image(Ireal);
hsvImageReal = rgb2hsv(Ireal);
figure;
imshow([hsvImageReal(:,:,1) hsvImageReal(:,:,2) hsvImageReal(:,:,3)]);
title('Image');

%%//Initial segmentation
croppedImageReal = hsvImageReal(:,295:305,:);
satThresh = 0.4;
valThresh = 0.3;
BWImageReal = (croppedImageReal(:,:,2) > satThresh & croppedImageReal(:,:,3) < valThresh);
figure;
subplot(1,2,1);
imshow(BWImageReal);
title('Image');

%%//Post-process
se = strel('line', 6, 90);
BWImageCloseReal = imclose(BWImageReal, se);
figure;
subplot(1,2,1);
imshow(BWImageCloseReal);
title('Image');

%%//Area open the image
figure;
areaopenReal = bwareaopen(BWImageCloseReal, 15);
subplot(1,2,1);
imshow(areaopenReal);
title('Image');

%%//Count how many objects there are
[~,countReal] = bwlabel(areaopenReal);
if countReal == 1
    ihsv='Real with 1 black line';
else
    ihsv=strcat('Fake with',32,num2str(countReal),' black lines');
end
%disp(['The total number of black lines for the note is: ' num2str(countReal)]);