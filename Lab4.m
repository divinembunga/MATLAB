[note,fsampling]=audioread('exercise1_piece.wav'); % reading in sound file
%plot(note);
amplitude_modulated_signal=ammod(note,30000,fsampling); %AM modulation
figure(1);
figure(2);
figure(3);

frequency_deviation =10000;
frequency_modulated_signal=fmmod(note,30000,fsampling,frequency_deviation);%FM modulation
N=16384;% number of points on signal
I=fftshift(abs(fft(note,N)));
F=fftshift(abs(fft(frequency_modulated_signal,N))); %shifting the signal
G=fftshift(abs(fft(amplitude_modulated_signal,N)));
newX=-fsampling/2:fsampling/N:fsampling/2-fsampling/N; % new x axis to incl '-'
figure(1)
plot(newX,I);
title('Unmodulated signal');
figure(2)
plot(newX,G);
title('AM Spectrum');
figure(3)
plot(newX,F);
title('FM Spectrum Freq Dev at 10KHz');