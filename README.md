# ASIC Implementation of 2D Convolution for Image Processing

This repository contains the hardware implementation of a 2D convolution accelerator designed for image processing applications. The project includes:

- **MATLAB Code:** Scripts to generate and test input images and convolution kernels.
- **Verilog Code:** RTL design for the Convolutor module and its testbench.
- **Test Inputs:** Sample input images in binary and integer formats.
- **Outputs:** Convolution results in binary and integer formats.

## Project Overview

This project implements 2D convolution for image processing using ASIC design. The convolution operation is essential for various image processing tasks such as blurring, sharpening, and edge detection. This project specifically focuses on using a Gaussian kernel for smoothing and a horizontal edge detection kernel.

## Workflow

1. **Input Image Acquisition:**
   - The input image is taken in JPG or PNG format.
   - The MATLAB script checks if the image is in RGB form. If not, it is converted to grayscale.

2. **Image Preprocessing:**
   - If the image is in RGB format, it is converted to grayscale using the formula: `Gray = 0.299*R + 0.587*G + 0.114*B`.
   - The grayscale image is then normalized and prepared for convolution.

3. **Convolution Operation:**
   - The prepared image is convoluted using either a Gaussian kernel for smoothing or a horizontal edge detection kernel.
   - The convolution operation is performed by the Verilog-based Convolutor module.

4. **Image Filtering:**
   - The output of the convolution is a filtered image, highlighting features based on the chosen kernel.
   - Both the input and output images are plotted to visually compare the results.

5. **Output Image to Matrix Conversion:**
   - The filtered image is converted into an output matrix.
   - This matrix is saved in two formats: one in integer form and another in binary form for further analysis.

## Project Highlights

- **Convolutor Module:** Performs 2D convolution on a 20x20 input image using a 3x3 kernel for horizontal edge detection or Gaussian smoothing.
- **Efficiency:** Designed for high-speed image processing with optimized hardware resources.
- **Testing:** Comprehensive testbench to validate the functionality of the convolution module.
