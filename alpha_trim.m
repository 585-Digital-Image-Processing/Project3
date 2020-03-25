
function  output = alpha_trim (img, alpha);

% img = imread('disk.gif'); % read the image

[m,n] = size (img);
output = zeros(m,n);

for i = 1:m
    for j = 1:n
        % set the neighborhood boundaries 
        row_min = max(1: i-2);
        row_max = min(m, i +2);
        col_min = max (1,j-2);
        col_max = min(n, j+2);
        %d=6;
        f = img(row_min: row_max, col_min:col_max);
        f = sort(f);
        t = floor(25*alpha);
         f = f(t+1:end-t);
         
%         for k = 1:6
%             f = f - ordfilt2(f, k, ones(5, 5)); 
%         end
%         for k = 20:25
%          f = f - ordfilt2(f, k, ones(5, 5)); 
%         end
        output(i,j) = mean(f(:));     
    end
end 
  output = uint8(output);  

     
        
        
        
        
        
        
        