input_image = imread('image_002.jpg');
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end
kernel_size = 5; 
sigma = 1.0; 
[x, y] = meshgrid(-floor(kernel_size/2):floor(kernel_size/2), -floor(kernel_size/2):floor(kernel_size/2));
gaussian_kernel = exp(-(x.^2 + y.^2) / (2 * sigma^2));
gaussian_kernel = gaussian_kernel / sum(gaussian_kernel(:));
convolved_image = conv2(double(input_image), gaussian_kernel, 'same');
fourier_transform = fftshift(fft2(double(input_image)));
magnitude_spectrum = log(1 + abs(fourier_transform));
disp('Input Image Size (rows x columns):');
disp(size(input_image));
disp('Output Image Size (rows x columns):');
disp(size(convolved_image));
figure;
subplot(2, 2, 1);
imshow(input_image, []);
title('Input Image');
subplot(2, 2, 2);
imshow(gaussian_kernel, []);
title('Gaussian Kernel');
subplot(2, 2, 3);
imshow(convolved_image, []);
title('Convolved Image');
subplot(2, 2, 4);
imshow(magnitude_spectrum, []);
title('Fourier Transform Magnitude');
