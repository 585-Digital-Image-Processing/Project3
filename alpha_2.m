img = imread('disk.gif'); % read the image

[m,n] = size (img);
A = zeros(m,n);
alpha = 0.25;

 
  for i=1:length(img)
     s = max(1,i-2);
     e = min(i+2,length(img));
     window = img(s:e);
     window = sort(window);
     t = floor(length(window)*alpha);
     window = window(t+1:end-t);
     A(i) = mean(window);
   end
  output = A;
  output = uint8(output);
  imshow(output);
  