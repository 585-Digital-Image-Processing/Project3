function output = symmetry_NNMF(img)

input = double(img);
[m, n] = size(input);
output = zeros(m, n);

val_vec = zeros(1, 13);

for i = 1:m
    for j = 1:n
        if i<3 || j<3 || i>m-3 || j>n-3
            continue;
        end
        k = 1;
        for p = 1:2
            for q = (-2):(2)
                t1 = input(i-p, j+q);
                t2 = input(i+p, j-q);
                if abs(t1-input(i,j))<abs(t2-input(i,j))
                    val_vec(k) = t1;
                else
                    val_vec(k) = t2;
                end
                k = k+1;
            end
        end
        
        % process the pixels which are in the same row of input(i, j)
        if abs(input(i, j-2)-input(i, j))<abs(input(i, j+2)-input(i, j))
            val_vec(k) = input(i, j-2);
        else
            val_vec(k) = input(i, j+2);
        end
        k = k+1;
        if abs(input(i, j-1)-input(i, j))<abs(input(i, j+1)-input(i, j))
            val_vec(k) = input(i, j-1);
        else
            val_vec(k) = input(i, j+1);
        end
        val_vec(k+1) = input(i, j);
        result = mean(val_vec);
        output(i,j) = result;
    end
end

% convert the output to unit8
output = uint8(output);

end

