% function sigma_filter is to apply sigma filter to the input A
% A: input, which is gray-scale image with unsigned int data type
% B: output, which is also gray-scale image with unsigned int data type
function B = sigma_filter(A)
    % change A's type to int
    A = cast(A, 'int16');
    [m,n] = size(A);
    B = A;
    % avoid out of range
    for i = 3:m-2
        for j = 3:n-2
            % To determine the value at A(i,j), takes  A(i-2:i+2, j-2:j+2)
            % out as the input
           inputs = A(i-2:i+2, j-2:j+2);
           % find out values whose difference with A(i,j) is smaller than 
           % 2 * sd =40
           ind = find(abs(inputs - A(i,j)) <= 40);
           % Count the number of such values, and calculate their sum
           Nc = length(ind);
           total = sum(inputs(ind));
           % save total/Nc to the output image
           B(i,j) = total/Nc;
        end
    end
    % cast B's data type to unsigned integer
    B = cast(B, 'uint8');
end