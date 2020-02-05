clear all;
[music,fsampling]=audioread('exercise2_piece.wav');%load in the music
%sound(music,fsampling); %play music
y=length(music);
disp(y);
N=2^nextpow2(y);

amplitude_modulated_signal=ammod(music,30000,fsampling); %AM modulation
amplitude_demodulated=[amdemod(amplitude_modulated_signal,30000, fsampling)];
noise=((randn(N,1))*0.01);



F=fftshift(abs(fft(amplitude_modulated_signal,N))); %shifting the signal
newX=-fsampling/2:fsampling/N:fsampling/2-fsampling/N; % new x axis to incl '-'
H=noise+F;
plot(newX,H);
title('AM Spectrum');

%[sound(H)];
%sound(amplitude_demodulated);
