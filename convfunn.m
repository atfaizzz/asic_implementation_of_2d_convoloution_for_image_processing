filePath = 'C:\Users\Faiz Abid\Desktop\Project Discipline\CNVD-Research Internship\binary_integers_1_to_400.txt';
fileID = fopen(filePath, 'r');
binaryData = textscan(fileID, '%s');
fclose(fileID);
imageData = zeros(400, 1);
for i = 1:400
    imageData(i) = bin2dec(binaryData{1}{i});
end
if length(imageData) ~= 400
    error('Input data must contain exactly 400 binary integers.');
end
image = reshape(imageData, [20, 20])';
kernel = [-1 -2 -1; 0 0 0; 1 2 1];
flipped_kernel = rot90(kernel,2);
conv_output = zeros(20, 20);
for i = 1:20
    for j = 1:20
        if i == 1 || i == 20 || j == 1 || j == 20
            conv_out = 0;
        else
            sub_matrix = image(i-1:i+1, j-1:j+1);
            conv_out = sum(sum(sub_matrix .* flipped_kernel));
        end
        conv_output(i, j) = conv_out;
    end
end
disp('Convolution Output:');
disp(conv_output);