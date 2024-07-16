input_dir = 'C:\Users\Faiz Abid\Desktop\Project Discipline\CNVD-Research Internship\In_Img_Out_Txtfile';
output_dir = input_dir;
input_basename = 'image_002';
output_filename = 'output_matrix.txt';
binary_output_filename = 'output_matrix_binary.txt';
file_extensions = {'.png', '.jpg', '.jpeg', '.bmp', '.tiff', '.gif'};
image_found = false;
for ext = file_extensions
    input_path = fullfile(input_dir, [input_basename, ext{1}]);
    if exist(input_path, 'file')
        image = imread(input_path);
        image_found = true;
        break;
    end
end
if ~image_found
    error(['Unable to find file with base name ', input_basename, ' in the directory ', input_dir]);
end
if size(image, 3) == 3
    image = rgb2gray(image);
end
gaussian_kernel = fspecial('gaussian', [5 5], 2);
output_image = conv2(double(image), double(gaussian_kernel), 'same');
output_path = fullfile(output_dir, output_filename);
dlmwrite(output_path, output_image, 'delimiter', '\t');
binary_output_path = fullfile(output_dir, binary_output_filename);
binary_matrix = dec2bin(output_image);
fid = fopen(binary_output_path, 'w');
for i = 1:size(binary_matrix, 1)
    fprintf(fid, '%s\n', binary_matrix(i, :));
end
fclose(fid);
figure;
subplot(1,3,1);
imshow(image, []);
title('Input Image');
subplot(1,3,2);
imagesc(gaussian_kernel);
colormap gray;
colorbar;
title('Gaussian Kernel');
subplot(1,3,3);
imshow(output_image, []);
title('Filtered Gaussian Image');
disp(['Output Image Matrix saved to ', output_path]);
disp(['Binary format Output saved to ', binary_output_path]);