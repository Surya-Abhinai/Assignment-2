% Frequencies for "Do Re Mi Fa So La Ti Do" in Hz
frequencies = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25];

% Duration of each tone in seconds
tone_duration = 1;

% Create a time vector for each tone
t = linspace(0, tone_duration, tone_duration * 44100); % Using a sampling rate of 44100 Hz (CD quality)

% Generate tones at different frequencies
tones = zeros(length(frequencies), length(t));
for i = 1:length(frequencies)
    tones(i, :) = sin(2 * pi * frequencies(i) * t);
end

% Append the tones together
sequence = reshape(tones', 1, []);

% Save the sequence as a .wav file
audiowrite('music_sequence.wav', sequence, 44100);

% Listen to the audio
sound(sequence, 44100);
