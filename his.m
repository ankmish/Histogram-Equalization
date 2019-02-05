tmp = imread('download.jpg'); 
I = tmp;
% If the image is a color image, change it to a gray image
[height,width, colormap]=size(tmp);
%if (colormap > 1)
 % disp(colormap);
  I = rgb2gray(tmp);
 % I = tmp[:,:,1];
 % imsave
% end

% show the original image
subplot(241)
imshow(I)
title('Original Image');

% no_of_pixels is the number of occurrences of each gray level
no_of_pixels = com_hist(I,'Histogram of Original Image',2);

% prob_of_pixel is the probability of an occurrence of each gray level
prob_of_pixel = com_normalized_hist(no_of_pixels,I,'Normalized Histogram of Original Image',3);

% cum_pixel is the cumulative distribution function
cum_pixel = comp_cumul_hist(prob_of_pixel,'Cumulative Histogram of Original Image',4);

% cum_pixel convert to new gray levels
mapping = zeros(1,256);
for i = 1:256
    mapping(i) = uint8(255*cum_pixel(i) + 0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=mapping(I(i,j) + 1);
    end
end
% show the new image
subplot(245)
imshow(I)
title('New Image');
%imsave



function f = com_hist(I,title1,position)
%compute_histogram 
%   I: the image
%   title1: histogram's title
%   position: histogram's position
[height,width]=size(I);
% Compute the number of occurrences of each gray level
no_of_pixels = zeros(1,256);                      % saare pixels ke occurance nikal lo
for i = 1:height
    for j = 1:width
        no_of_pixels( I(i,j) + 1 ) = no_of_pixels( I(i,j) + 1 ) + 1;
    end
end

subplot(2,4,position)
bar(no_of_pixels)
title(title1);
f = no_of_pixels;
end


function f = com_normalized_hist(no_of_pixels,I,title1,position)
%compute_normalized_histogram
%   no_of_pixels: number of each gray level
%   I: the image
%   title1: histogram's title
%   position: histogram's position

[height,width]=size(I);

% Compute the probability of an occurrence of each gray level
prob_of_pixel = zeros(1,256);
for i = 1:256
    prob_of_pixel(i) = no_of_pixels(i) / (height * width * 1.0);
end

%subplot(2,4,position)
%bar(prob_of_pixel)
%title(title1);

f = prob_of_pixel;
end

function f = comp_cumul_hist(prob_of_pixel,title1,position)
%compute_cumulative_histogram
%   prob_of_pixel: probability density of each gray level
%   title1: histogram's title
%   position: histogram's position

% Compute the cumulative distribution function
cum_pixel = zeros(1,256);
for i = 1:256
    if (i == 1)
        cum_pixel(i) = prob_of_pixel(i);
    else
        cum_pixel(i) = cum_pixel(i-1) + prob_of_pixel(i);
    end
end

%subplot(2,4,position);
%bar(cum_pixel)
%title(title1);

f = cum_pixel;
end
