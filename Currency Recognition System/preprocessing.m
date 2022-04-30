function pim=preprocessing(im)

%resizing the image
pim=imresize(im,[470 1000]);

figure;
imshow(pim);

im(:,:,1)=medfilt2(im(:,:,1));
im(:,:,2)=medfilt2(im(:,:,2));
im(:,:,3)=medfilt2(im(:,:,3));

%redChannel = im(:, :, 1);
%greenChannel = im(:, :, 2);
%blueChannel = im(:, :, 3);
%meanR = mean2(redChannel)
%meanG = mean2(greenChannel)
%meanB = mean2(blueChannel)
%im = cat(3, redChannel - meanR, greenChannel - meanG, blueChannel - meanB);

%im(:,:,1)=histeq(im(:,:,1));
%im(:,:,2)=histeq(im(:,:,2));
%im(:,:,3)=histeq(im(:,:,3));

figure;
imshow(im);

im=rgb2gray(im);

%level=graythresh(im);

im=imbinarize(im,'adaptive','ForegroundPolarity','dark','Sensitivity',0.15);

figure;
imshow(im);

points=detectSURFFeatures(im);

disp(points);

roi=[20 50 100 100];

result=ocr(im,roi);
disp(result.Text);



