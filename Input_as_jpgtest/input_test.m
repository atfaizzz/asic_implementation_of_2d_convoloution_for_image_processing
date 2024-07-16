input_image = imread('image_002.jpg');
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end
kernel = [-1 -2 -1;
           0  0  0;
           1  2  1];
convolved_image = conv2(double(input_image), kernel, 'same');
disp('Kernel:');
disp(kernel);
disp('Convolved Image:');
disp(convolved_image);
figure;
subplot(1, 3, 1);
imshow(input_image, []);
title('Input Image');
subplot(1, 3, 2);
imshow(kernel, []);
title('Kernel');
subplot(1, 3, 3);
imshow(convolved_image, []);
title('Convolved Image');