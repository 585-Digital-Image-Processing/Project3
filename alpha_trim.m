
img = imread('disk.gif'); % read the image
d =5

f = imfilter(img, ones(5, 5), 'replicate'); 
for k = 1:d/2
 f = f - ordfilt2(img, k, ones(5, 5), 'replicate'); 
end
for k = (m*n - d/2 + 1):m*n
 f = f - ordfilt2(img, k, ones(5, 5), 'replicate'); 
end
f = f/(25 - d); 