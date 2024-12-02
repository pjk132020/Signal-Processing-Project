clear; % Remove all variables from the workspace

% Sampling frequency 
FS = 8000;

% Define the notes with durations > Both
C = sin(2*pi*261.63*(0:1/FS:0.4)); % C note (short)
D = sin(2*pi*293.66*(0:1/FS:0.4)); % D note (short)
E = sin(2*pi*329.63*(0:1/FS:0.4)); % E note (short)
F = sin(2*pi*349.23*(0:1/FS:0.4)); % F note (short)
G = sin(2*pi*392.00*(0:1/FS:0.4)); % G note (short)
A = sin(2*pi*440.00*(0:1/FS:0.4)); % A note (short)
B = sin(2*pi*493.88*(0:1/FS:0.4)); % B note (short)
Bb = sin(2*pi*466.16*(0:1/FS:0.4)); % Bb note (short)

% Define longer duration notes for some parts of the song > Both
C_long = sin(2*pi*261.63*(0:1/FS:0.8)); % C note (longer)
D_long = sin(2*pi*293.66*(0:1/FS:0.8)); % D note (longer)
E_long = sin(2*pi*329.63*(0:1/FS:0.8)); % E note (longer)
F_long = sin(2*pi*349.23*(0:1/FS:0.8)); % F note (longer)
G_long = sin(2*pi*392.00*(0:1/FS:0.8)); % G note (longer)
A_long = sin(2*pi*440.00*(0:1/FS:0.8)); % A note (longer)
B_long = sin(2*pi*493.88*(0:1/FS:0.8)); % B note (longer)
Bb_long = sin(2*pi*466.16*(0:1/FS:0.8)); % Bb note (longer)

% Silence (pause between notes) > Pavan
pause = zeros(1, FS*0.2); % 0.2 seconds of silence

% Assemble the song using the sequence of notes > Both
line1 = [C, pause, C, pause, D, pause, C, pause, F, pause, E, pause]; % Happy birthday to you
line2 = [C, pause, C, pause, D, pause, C, pause, G, pause, F, pause]; % Happy birthday to you
line3 = [C, pause, C, pause, C, pause, A, pause, F, pause, E, pause, D, pause]; % Happy birthday dear [Name]
line4 = [Bb, pause, Bb, pause, A, pause, F, pause, G, pause, F, pause]; % Happy birthday to you

% Combine all lines to form the complete song > Both
song = [line1, line2, line3, line4]; 

% Save the song as a .wav file > Both
audiowrite('Happy_Birthday.wav', song, FS);

% Play the song > Both
[y, FS] = audioread('Happy_Birthday.wav');
sound(y, FS);

disp('Playing Happy Birthday Song');
disp('Song audio saved as "Happy_Birthday.wav".');

% Generate the time vector for the signal > Imran
t = (0:length(y)-1) / FS;

% Create a figure with three subplots
figure; 

% Downsample the signal for better visualization > Imran
downsample_factor = 50; % Reduce data points by a factor of 50 > Imran
y_downsampled = y(1:downsample_factor:end); % Take every 50th point > Imran
t_downsampled = t(1:downsample_factor:end); % Adjust the time vector > Imran

% 1. Time Domain Plot > Imran
subplot(3, 1, 2);
plot(t_downsampled, y_downsampled); % Plot the downsampled data
xlim([0 15]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain of Happy Birthday');
grid on;

% 2. Frequency Domain Plot > Imran
N = length(y); % Number of samples
f = (0:N-1) * (FS / N); % Frequency vector
fft_y = abs(fft(y)); % Compute magnitude of FFT

subplot(3, 1, 3);
plot(f(1:floor(N/2)), fft_y(1:floor(N/2))); % Only plot positive frequencies
xlim([0 1000]); % Limit x-axis to 0-1000 Hz
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Domain of Happy Birthday');
grid on;

% 3. Spectrogram Plot > Both
subplot(3, 1, 1);
spectrogram(song, 256, 250, 256, FS, 'yaxis'); % Window length, overlap, FFT size, sampling frequency
title('Spectrogram of Happy Birthday');
colorbar;