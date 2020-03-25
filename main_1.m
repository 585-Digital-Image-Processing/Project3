
mean_std = [];
%% 5x5 mean
img = imread('disk.gif'); % read the image
figure(1)
subplot(131)
imshow(img);
title('original image');
hold on
output_mean = mean5x5(img);
for i = 1: 5
    output_5_mean = mean5x5(img);
    img = output_5_mean;
end

subplot(132)
imshow(output_mean);
title('5x5 mean 1 iteration');
subplot(133)
imshow(output_5_mean);
title('5x5 mean 5 iterations');
hold off

figure(2)
imhist(output_5_mean);
title('histogram of 5x5 mean after 5 iterations');

% Find the position of large disk, 
large_disk_m = (output_5_mean(50:181, 32:150));
imhist(large_disk_m);
large_ind = find(large_disk_m > 100);
large_disk = large_disk_m(large_ind);
large_disk = cast(large_disk, 'single');

mean_std = [mean_std; mean(large_disk), std(large_disk)];

%% 5x5 median filter
img = imread('disk.gif');
figure(3)
subplot(131)
imshow(img);
title('original image');
hold on
output_med = medfilt2(img,[5 5]);
for i = 1: 5
    output_5_med = medfilt2(img,[5 5]);
    img = output_5_med;
end
subplot(132)
imshow(output_med);
title('5x5 median filter 1 iteration');
subplot(133)
imshow(output_5_med);
title('5x5 median filter 5 iterations');
hold off;
%suptitle('5x5 median filter');

figure(4)
imhist(output_5_med);
title('histogram of 5x5 median after 5 iterations');

% Find the position of large disk, 
large_disk_m = (output_5_med(50:181, 32:150));
large_disk = large_disk_m(large_ind);
large_disk = cast(large_disk, 'single');

mean_std = [mean_std; mean(large_disk), std(large_disk)];

%% alpha_trim mean
img = imread('disk.gif');
figure(5)
subplot(131)
imshow(img);
title('orignal image');
hold on
output_alpha = alpha_trim(img, 0.25);
for i = 1: 5
    output_5_alpha = alpha_trim(img, 0.25) ;
    img = output_5_alpha;
end
subplot(132)
imshow(output_alpha);
title('alpha trim filter 1 iteration');
subplot(133)
imshow(output_5_alpha);
title(' alpha trim filter 5 iterations')
hold off;
%suptitle('alpha trimmed filter');

figure(6)
imhist(output_5_alpha);
title(' histogram of alpha trimmed filter after 5 iterations');

% Find the position of large disk, 
large_disk_m = (output_5_alpha(50:181, 32:150));
large_disk = large_disk_m(large_ind);
large_disk = cast(large_disk, 'single');

mean_std = [mean_std; mean(large_disk), std(large_disk)];

%% Sigma filter
img = imread('disk.gif');
figure()
subplot(1,3,1)
imshow(img);
title('original image');
hold on
output_sigma = sigma_filter(img);
for i = 1: 5
    output_5_sigma = sigma_filter(img);
    img = output_5_sigma;
end
subplot(1,3,2)
imshow(output_sigma);
title('sigma filter 1 iteration');
subplot(1,3,3)
imshow(output_5_sigma);
title('sigma filter 5 iteration');
hold off;
%suptitle('sigma filter');

figure()
imhist(output_5_sigma);
title('histogram of sigma filter after 5 iterations');

% Find the position of large disk, 
large_disk_m = (output_5_sigma(50:181, 32:150));
large_disk = large_disk_m(large_ind);
large_disk = cast(large_disk, 'single');

mean_std = [mean_std; mean(large_disk), std(large_disk)];
%% Symmetric Nearest Neighbor Mean Filter
img = imread('disk.gif');
figure(9)
subplot(131)
imshow(img);
title('original image');
hold on
output_SNNMF = symmetry_NNMF(img);
for i = 1:5
    output_5_SNNMF = symmetry_NNMF(img);
    img = output_5_SNNMF;
end
subplot(132)
imshow(output_SNNMF);
title(' 1 iteration');
subplot(133)
imshow(output_5_SNNMF);
title(' 5 iterations');
hold off;
%suptitle(' symmetric nearest-neighbor mean filter');

figure(10)
imhist(output_5_SNNMF);
title(' histogram of symmetric nearest-neighbor mean filter');

% Find the position of large disk, 
large_disk_m = (output_5_alpha(50:181, 32:150));
large_disk = large_disk_m(large_ind);
large_disk = cast(large_disk, 'single');

mean_std = [mean_std; mean(large_disk), std(large_disk)];

rowNames = {'mean','median','alpha-trimmed mean', 'sigma-filter', 'symmetric nearest-neighbor mean'};
colNames = {'mean','standard deviation'};
mean_std_table = array2table(mean_std,'RowNames',rowNames,'VariableNames',colNames)

%% Part II Anisotropic Diffusion for Image Filtering:

