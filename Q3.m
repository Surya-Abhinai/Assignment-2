% Load the original audio file
filename = 'Track001.wav';
[y, original_fs] = audioread(filename);

% Different downsampling factors
downsampling_factors = [2, 3, 4];

% Perform downsampling and listen to the audio
for i = 1:length(downsampling_factors)
    factor = downsampling_factors(i);
    
    % Downsample
    downsampled_signal = downsample(y, factor);
    new_fs = original_fs / factor;
    
    % Save the downsampled signal as a .wav file
    output_filename = sprintf('downsampled_%dx.wav', factor);
    audiowrite(output_filename, downsampled_signal, new_fs);
    
    % Listen to the downsampled audio
    sound(downsampled_signal, new_fs);
    pause(length(downsampled_signal) / new_fs + 0.5); % Pause to hear the audio
end

% Upsampling while preserving frequency content
upsampling_factor = 2;

% Perform upsampling
upsampled_signal = ifft(fft(y) .* [ones(1, upsampling_factor), zeros(1, length(y) * (upsampling_factor - 1))]);

% Normalize the amplitude to match the original signal
upsampled_signal = upsampled_signal / max(abs(upsampled_signal)) * max(abs(y));

% Save the upsampled signal as a .wav file
output_filename = sprintf('upsampled_%dx.wav', upsampling_factor);
audiowrite(output_filename, upsampled_signal, original_fs);

% Listen to the upsampled audio
sound(upsampled_signal, original_fs);
