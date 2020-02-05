clear all;
close all;
i=0;
QAM_values=[4,16,64,265];
SNR=0:2:25;
for QAM= 1:length(QAM_values)
    size=1000000;
    stream=randi([0 QAM_values(QAM)-1],size,1); %generating the random bits
    mod=qammod(stream,QAM_values(QAM)); %modulating the stream according to the QAM
    T_Errors = 0;  %initialising the variables
    T_bits = 0;
    for i=1:length(SNR)
      % SNR=snr + 10*log10(4); 
       signal_noise=awgn(mod,SNR(i),'measured');
       Dem=qamdemod(signal_noise,QAM_values(QAM));
        diff = stream - Dem;
        T_Errors = T_Errors + sum(abs(diff));
        T_bits = T_bits + length(stream);
    end
    % Calculate Bit Error Rate
       BER(QAM) = T_Errors / T_bits;
       disp(sprintf('bit error probability = %f',BER(QAM)));
    
figure(1);
semilogy(SNR,BER,'or');
hold on;
grid on
title('BER Vs SNR Curve');
xlabel('SNR (dB)'); ylabel('BER')


end
