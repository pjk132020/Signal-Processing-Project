# Signal-Processing-Project

## README for Happy Birthday Song and Filtering Project

This project consists of two main MATLAB scripts:
1. Happy Birthday Song Generation
2. Noisy Signal Addition and Filtering

---

### Requirements:
1. MATLAB Software (Any version that supports basic audio operations and plotting)
2. Basic understanding of navigating MATLAB (opening scripts, running commands)

---

### Instructions to Run the Programs:

#### Using MATLAB Software (Installed on Your Computer)
1. **Install MATLAB Software:**
   - Ensure MATLAB is installed on your computer. You can download it from [MathWorks](https://www.mathworks.com/).

2. **Open MATLAB:**
   - Launch the MATLAB software on your computer.

3. **Set Working Directory:**
   - Place/copy the script files `happy_birthday_song.m` and `signal_filtering.m` in your MATLAB working directory. You can set the working directory using the file explorer in MATLAB or by typing `cd 'path_to_your_directory'` in the command window.

4. **Run the Song Generation Script:**
   - In the MATLAB command window, type: `run('happy_birthday_song.m')` and press Enter OR press the "Run" button (green triangle) at the top of the editor window.
   - The script will generate the "Happy Birthday" song, save it as `Happy_Birthday.wav`, play the song, and display plots for the time domain, frequency domain, and spectrogram of the song.
   - The generated audio file `Happy_Birthday.wav` will be saved in your working directory.

5. **Run the Signal Filtering Script:**
   - Ensure `Happy_Birthday.wav` (generated from the previous step) is in your working directory.
   - In the MATLAB command window, type: `run('signal_filtering.m')` and press Enter OR press the "Run" button (green triangle) at the top of the editor window.
   - The script will load the `Happy_Birthday.wav` file, add white Gaussian noise, save the noisy version as `noisy_output.wav`, and display the noisy signal.
   - The script will then apply a low-pass filter to the noisy signal, save the filtered version as `filtered_output.wav`, and display the filtered signal.
   - The generated audio files `noisy_output.wav` and `filtered_output.wav` will be saved in your working directory.

#### Using MATLAB Online IDE
1. **Access MATLAB Online:**
   - Go to [MATLAB Online](https://matlab.mathworks.com/).

2. **Log In:**
   - Log in with your MathWorks account. If you don't have an account, you can create one for free.

3. **Upload Scripts:**
   - Upload the script files `happy_birthday_song.m` and `signal_filtering.m` to your MATLAB Online workspace. Use the file browser to navigate to your files and upload them.

4. **Run the Song Generation Script:**
   - Click on the uploaded `happy_birthday_song.m` file to open it in the editor.
   - Click the "Run" button (green triangle) at the top of the editor window.
   - The script will generate the "Happy Birthday" song, save it as `Happy_Birthday.wav`, play the song (if your browser supports audio playback), and display plots for the time domain, frequency domain, and spectrogram of the song.
   - The generated audio file `Happy_Birthday.wav` will be saved in your MATLAB Online workspace.

5. **Run the Signal Filtering Script:**
   - Ensure `Happy_Birthday.wav` (generated from the previous step) is in your MATLAB Online workspace.
   - Click on the uploaded `signal_filtering.m` file to open it in the editor.
   - Click the "Run" button (green triangle) at the top of the editor window.
   - The script will load the `Happy_Birthday.wav` file, add white Gaussian noise, save the noisy version as `noisy_output.wav`, and display the noisy signal.
   - The script will then apply a low-pass filter to the noisy signal, save the filtered version as `filtered_output.wav`, and display the filtered signal.
   - The generated audio files `noisy_output.wav` and `filtered_output.wav` will be saved in your MATLAB Online workspace.

---

### File Descriptions:
1. `happy_birthday_song.m`: MATLAB script to generate, save, and visualize the Happy Birthday song.
2. `signal_filtering.m`: MATLAB script to add noise to the Happy Birthday song, apply a low-pass filter, and visualize the signals.
3. `Happy_Birthday.wav`: The generated Happy Birthday song audio file.
4. `noisy_output.wav`: The generated noisy version of the Happy Birthday song.
5. `filtered_output.wav`: The generated filtered version of the noisy Happy Birthday song.
6. `EENG 341 - Term Project - Pavan & Imran`: Report for the project contains the analysis of the signal.

---

### Troubleshooting:
1. Ensure that MATLAB is properly installed and configured on your system.
2. Confirm that all required files are in the working directory before running the scripts.
3. If you encounter errors, check the command window for detailed messages and verify that you have followed the instructions correctly.
4. For further assistance, consult MATLAB's documentation or support resources.

---

### Credits:
This project was created to demonstrate audio signal processing using MATLAB. Enjoy experimenting and exploring the world of audio processing!

---
