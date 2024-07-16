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
padded_kernel = zeros(20, 20);
padded_kernel(1:size(kernel,1), 1:size(kernel,2)) = kernel;
fft_image = fft2(image);
fft_kernel = fft2(padded_kernel);
fft_product = fft_image .* fft_kernel;
conv_output = ifft2(fft_product);
conv_output = real(conv_output);
disp('Convolution Output:');
disp(conv_output);