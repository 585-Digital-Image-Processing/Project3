img = imread('disk.gif'); % read the image

% 5x5 mean
figure(1)
subplot(131)
imshow(img);
hold on
output_mean = mean5x5(img);
for i = 1: 5
    output_5_mean = mean5x5(img);
    img = output_5_mean;
end

subplot(132)
imshow(output_mean);
subplot(133)
imshow(output_5_mean);
hold off

figure(2)
imhist(output_5_mean);


% median filter
img = imread('disk.gif');
figure(3)
subplot(131)
imshow(img);
hold on
output_med = medfilt2(img,[5 5]);
for i = 1: 5
    output_5_med = medfilt2(img,[5 5]);
    img = output_5_med;
end
subplot(132)
imshow(output_med);
subplot(133)
imshow(output_5_med);
hold off;

figure(4)
imhist(output_5_med);