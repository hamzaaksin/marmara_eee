clc; clear; close all;


test_image = imread('barbara_gray.bmp');


figure;
imshow(test_image,[]);
title('Original (512x512)');


F = fft2(double(test_image)); 
F_shifted = fftshift(F); 
magnitude_spectrum = log10(1 + abs(F_shifted)); 

figure;
imshow(magnitude_spectrum, []);
title('Fourier Spektrumu');


downsampled_image = test_image(1:2:end, 1:2:end);

figure;
imshow(downsampled_image,[]);
title('Downsampled (256x256)');


F_down = fft2(double(downsampled_image)); 
F_down_shifted = fftshift(F_down); 
magnitude_spectrum_down = log10(1 + abs(F_down_shifted));

figure;
imshow(magnitude_spectrum_down, []);
title('Fourier Spektrumu (Downsampled)');


upsampled_image = imresize(downsampled_image, [512 512], 'bicubic'); %interpolasyon yapıyoruz

figure;
imshow(upsampled_image,[]);
title('Upsampled (512x512)');


F_up = fft2(double(upsampled_image)); 
F_up_shifted = fftshift(F_up); 
magnitude_spectrum_up = log10(1 + abs(F_up_shifted));

figure;
imshow(magnitude_spectrum_up, []);
title('Fourier Spektrumu (Upsampled)');
