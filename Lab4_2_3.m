clear all;
[music,fsampling]=audioread('exercise2_piece.wav');%load in the music
%sound(music,fsampling); %play music
y=length(music);
disp(y);
N=2^nextpow2(y);

frequency_deviation =50000;
frequency_modulated_signal=fmmod(music,30000,fsampling,frequency_deviation);%FM modulation
frequency_demodulated=fmdemod(frequency_modulated_signal,30000, fsampling,frequency_deviation);%FM demodulation
noise=((randn(N,1))*0.01); %adding noise

F=fftshift(abs(fft(frequency_modulated_signal,N))); %shifting the signal
newX=-fsampling/2:fsampling/N:fsampling/2-fsampling/N; % new x axis to incl '-'
H=noise+F;

plot(newX,H);
title('FM Spectrum Freq Deviation at 50KHz');

%[sound(H)];
%sound(amplitude_demodulated);
