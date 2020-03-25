function output =mean5x5(img)

%img = imread('disk.gif');


[m,n] = size (img);

output = zeros(m,n);

for i = 1:m
    for j = 1:n
        % set the neighborhood boundaries 
        row_min = max(1: i-2);
        row_max = min(m, i +2);
        col_min = max (1,j-2);
        col_max = min(n, j+2);
        
        temp = img(row_min: row_max, col_min:col_max);
        
        % ith pixel of the output will be the average of neighborhood
        
        output(i,j) = mean(temp(:));
    end
end

% convert the output to unit8
output = uint8(output);
end

% figure(1);
% subplot(121)
% imshow(img);
% subplot(122);
% imshow(output);

        