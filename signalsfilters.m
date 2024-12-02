clear; close all; clc;

% Load the original audio file > Pavan
[inputFile, FS] = audioread('Happy_Birthday.wav');
originalSignal = inputFile(:, 1); % Use one channel if stereo


% Normalize the signal > Pavan
originalSignal = originalSignal / max(abs(originalSignal));

% Downsample factor > Imran
downsampleFactor = 50;

% Downsample the time domain signal > Imran
timeVector = (0:length(originalSignal)-1)/FS; % Ensure valid time vector > Pavan
timeVectorDownsampled = timeVector(1:downsampleFactor:end); % Downsample time vector > Imran
originalSignalDownsampled = originalSignal(1:downsampleFactor:end); % Downsample signal > Imran

% Plot the original signal in the time and frequency domains > Both
figure;
subplot(3, 1, 1);
plot(timeVectorDownsampled, originalSignalDownsampled); % Downsampled time domain > Imran
title('Original Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
freq = linspace(0, FS, length(originalSignal));
originalFFT = abs(fft(originalSignal));
plot(freq(1:floor(end/2)), originalFFT(1:floor(end/2))); % Show only positive frequencies
xlim([0 1000]);
title('Original Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

disp('Playing the original signal...');

% Original song > Imran
sound(inputFile, FS);
pause(length(inputFile)/FS + 1);


% a. Add white Gaussian noise to the signal > Pavan 
snrValue = 10; % Desired signal-to-noise ratio in dB
noisySignal = awgn(originalSignal, snrValue, 'measured'); % Add noise

% Calculate the noise > Imran
noise = noisySignal - originalSignal;

% Normalize noisy signal to avoid clipping when saving > Pavan
noisySignal = noisySignal / max(abs(noisySignal)); 

% Save the noisy signal as a .wav file > Pavan
audiowrite('noisy_output.wav', noisySignal, FS);

% Plot the noisy signal in time and frequency domains > Both
figure;
subplot(3, 1, 1);
plot(timeVector, noisySignal);
xlim([0 15]);
title('Noisy Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
noisyFFT = abs(fft(noisySignal));
plot(freq(1:floor(end/2)), noisyFFT(1:floor(end/2))); % Show only positive frequencies
xlim([0 1000]);
title('Noisy Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


% Calculate the Signal-to-Noise Ratio (SNR) > Imran
disp('Playing the noisy signal...');
calculatedSNR = snr(originalSignal, noise);
disp(['Signal-to-Noise Ratio of Noisy Signal: ', num2str(calculatedSNR), ' dB']);

% Play the noisy signal > Both
sound(noisySignal, FS);
pause(length(noisySignal)/FS + 1); % Wait for playback to finish

% b. Design a filter to remove noise > Pavan
% Using a low-pass filter (Butterworth)
filterOrder = 5;
cutoffFrequency = 1000; % Adjust based on signal characteristics (Hz)
[b, a] = butter(filterOrder, cutoffFrequency / (FS / 2), 'low'); % Low-pass filter
filteredSignal = filter(b, a, noisySignal);

% Normalize filtered signal to avoid clipping when saving > Pavan
filteredSignal = filteredSignal / max(abs(filteredSignal)); 

% Save the filtered signal as a .wav file > Both
audiowrite('filtered_output.wav', filteredSignal, FS);

% Plot the filtered signal in time and frequency domains > Both
figure;
subplot(3, 1, 1);
plot(timeVector, filteredSignal);
xlim([0 15]);
title('Filtered Signal (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
filteredFFT = abs(fft(filteredSignal));
plot(freq(1:floor(end/2)), filteredFFT(1:floor(end/2))); % Show only positive frequencies
xlim([0 1000]);
title('Filtered Signal (Frequency Domain)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Play the filtered signal > Pavan 
disp('Playing the filtered signal...');
sound(filteredSignal, FS);

disp('Filtered audio saved as "filtered_output.wav".');
disp('Noisy audio saved as "noisy_output.wav".');