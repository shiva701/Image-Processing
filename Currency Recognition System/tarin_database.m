[imname,impath]=uigetfile({'*.jpg;*.png'});
im=imread([impath,'/',imname]);
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
 

fet=totalfeature(rgbim);
fet=double(fet);

load dbtest;

len=length(x);
len=len+1;
disp(len);
x(len).feature=fet;


