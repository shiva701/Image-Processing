%% clear workspace and command window
%clear;clc;
%% read image
%[imname,impath]=uigetfile({'*.jpg;*.png'});
%im=imread([impath,'/',imname]);
%preprocessing
%resize image
function cr=currency_recognition(im)
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 
 %imshow(rgbim);
 %featureextraction
fet=totalfeature(rgbim);
load dbtest;
k=length(x);
for j=1:k
    D(j)=dist(fet',x(j).feature);
end
[value,index]=min(D);
value=value/1000000000;
if value<.001
   currency_name=x(index).name;
  denom=x(index).denom;
  c=strcat(num2str(denom),32,currency_name);
  cr=c;
else
    cr='no matches found';
  %cr=c;
 % c=1;
end