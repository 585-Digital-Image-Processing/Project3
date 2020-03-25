function [output_0, output_20, output_50, output_100] = Anisotropic_Diffusion_rev(img, t, k)

input_current = double(img);
[m, n] = size(input_current);
input_next = zeros(m, n);
output_0 = img;

for iteration = 1:t
    for i=1:m
        for j=1:n
            if i<2 || j<2 || i>m-2 || j>n-2
                continue;
            end
            del_N = input_current(i,j+1)-input_current(i,j);
            del_S = input_current(i,j-1)-input_current(i,j);
            del_W = input_current(i-1,j)-input_current(i,j);
            del_E = input_current(i+1,j)-input_current(i,j);
            c_N = 1/(1+(abs(del_N)/k)^2);
            c_S = 1/(1+(abs(del_S)/k)^2);
            c_W = 1/(1+(abs(del_W)/k)^2);
            c_E = 1/(1+(abs(del_E)/k)^2);
            input_next(i,j) = input_current(i,j)+0.25*(c_N*del_N+c_S*del_S+c_W*del_W+c_E*del_E);
        end
    end
    if iteration == 20
        output_20 = uint8(input_next);
    end
    if iteration == 50
        output_50 = uint8(input_next);
    end
    if iteration == 100
        output_100 = uint8(input_next);
    end
    input_current = input_next;
end

end

