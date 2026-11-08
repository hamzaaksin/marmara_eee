
lena = imread('C:\Users\LENOVO\Desktop\lena.jpg');
boats = imread('C:\Users\LENOVO\Desktop\boats.jpg');


lena_gray = rgb2gray(lena);
boats_gray = rgb2gray(boats);

fft_lena = fft2(lena_gray);
fft_boats = fft2(boats_gray);


fft_lena_zero_phase = fft_lena;
fft_lena_zero_phase(abs(fft_lena_zero_phase) > 0) = 0;

lena_zero_phase = ifft2(fft_lena_zero_phase);


figure;
subplot(2, 2, 1), imshow(lena_gray), title('Original Lena');
subplot(2, 2, 2), imshow(abs(fft_lena_zero_phase)), title('Lena Fourier with Zero Phase');

subplot(2, 2, 3), imshow(abs(lena_zero_phase), []), title('Inverse Fourier Transform');


fft_lena_magnitude = abs(fft_lena);
fft_boats_phase = angle(fft_boats);

fft_combined = fft_lena_magnitude .* exp(1i * fft_boats_phase);

combined_image = ifft2(fft_combined);


subplot(2, 2, 4), imshow(abs(combined_image), []), title('Combined Magnitude Lena-Boats');


fft_boats_magnitude = abs(fft_boats);

fft_combined = fft_boats_magnitude .* exp(1i * angle(fft_lena));

combined_image_boats = ifft2(fft_combined);


figure;
subplot(1, 2, 1), imshow(abs(combined_image_boats), []), title('Boats Magnitude, Lena Phase');
subplot(1, 2, 2), imshow(boats_gray), title('Original Boats');
