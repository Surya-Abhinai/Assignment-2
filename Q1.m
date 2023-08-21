alpha = 1 + mod(231, 3);

% Generate time vector
t = 0:1/alpha:(10 - 1/alpha);

% Generate individual signals
y1 = alpha .* cos(5 * alpha .* t);
y2 = (alpha / 2) .* cos(6 * alpha .* t);
y3 = (alpha / 4) .* cos(10 * alpha .* t);

% Plot individual signals
subplot(4, 1, 1);
plot(t, y1);
xlabel('Time');
ylabel('Amplitude');
title('y1');

subplot(4, 1, 2);
plot(t, y2);
xlabel('Time');
ylabel('Amplitude');
title('y2');

subplot(4, 1, 3);
plot(t, y3);
xlabel('Time');
ylabel('Amplitude');
title('y3');

% Combine signals
combined_signal = y1 + y2 + y3;

subplot(4, 1, 4);
plot(t, combined_signal);
xlabel('Time');
ylabel('Amplitude');
title('Combined Signal y1 + y2 + y3');

% Sampling frequencies
Fs = 14 * alpha;
Fs1 = 20 * alpha;
Fs2 = 9 * alpha;

% Generate time vectors for sampled signals
t_sampling = 0:1/Fs:(10 - 1/Fs);
t_sampling1 = 0:1/Fs1:(10 - 1/Fs1);
t_sampling2 = 0:1/Fs2:(10 - 1/Fs2);

% Sample the combined signal with different frequencies
sampled_signal = alpha .* cos(5 * alpha .* t_sampling) ...
               + (alpha / 2) .* cos(6 * alpha .* t_sampling) ...
               + (alpha / 4) .* cos(10 * alpha .* t_sampling);

sampled_signal1 = alpha .* cos(5 * alpha .* t_sampling1) ...
                + (alpha / 2) .* cos(6 * alpha .* t_sampling1) ...
                + (alpha / 4) .* cos(10 * alpha .* t_sampling1);

sampled_signal2 = alpha .* cos(5 * alpha .* t_sampling2) ...
                + (alpha / 2) .* cos(6 * alpha .* t_sampling2) ...
                + (alpha / 4) .* cos(10 * alpha .* t_sampling2);

% Compute the FFT of the sampled signals
fft_signal = fft(sampled_signal);
fft_signal1 = fft(sampled_signal1);
fft_signal2 = fft(sampled_signal2);

% Frequency vector for plotting
f = Fs * (0:(length(fft_signal) / 2)) / length(fft_signal);
f1 = Fs1 * (0:(length(fft_signal1) / 2)) / length(fft_signal1);
f2 = Fs2 * (0:(length(fft_signal2) / 2)) / length(fft_signal2);

% Compute the single-sided amplitude spectrum and discard the negative frequencies
amplitude_spectrum = 2 * abs(fft_signal(1:length(fft_signal) / 2 + 1)) / length(fft_signal);
amplitude_spectrum1 = 2 * abs(fft_signal1(1:length(fft_signal1) / 2 + 1)) / length(fft_signal1);
amplitude_spectrum2 = 2 * abs(fft_signal2(1:length(fft_signal2) / 2 + 1)) / length(fft_signal2);

% Plot the amplitude spectra
figure;
subplot(3, 1, 1);
plot(f, amplitude_spectrum);
title('Amplitude Spectrum of 3(a)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(f1, amplitude_spectrum1);
title('Amplitude Spectrum of 3(b)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(f2, amplitude_spectrum2);
title('Amplitude Spectrum of 3(c)');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
