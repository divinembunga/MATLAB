clear all;
size=10^6;
i=0;
f=1;
SNR_values=[0:2:35];
QAM_values=[4,16,64,256];
for QAM=1:length(QAM_values)
    stream=randi([0,QAM_values(QAM)-1],size,1);
    mod=qammod(stream,QAM_values(QAM));
    for i= 1:length(SNR_values)
        noisy=awgn(mod,SNR_values(i),'measured');
        if(QAM==2 && i==11)
            disp(SNR_values(i));
             const=comm.ConstellationDiagram('ShowReferenceConstellation', false, 'XLimits', [-4 4], 'YLimits', [-4 4]);  step(const, noisy);
             step(const,noisy);
        end
        z=qamdemod(noisy,QAM_values(QAM));
        BER_QAM(QAM,i)=(length(stream)-sum(stream==z))/length(stream);
    end
end
 
    semilogy(SNR_values,BER_QAM(1,:),SNR_values,BER_QAM(2,:),SNR_values,BER_QAM(3,:),SNR_values,BER_QAM(4,:));
    title('BER Curves');
    xlabel('SNR (dB)');
    ylabel('BER');
    legend('4-QAM', '16-QAM', '64-QAM', '256-QAM');
    gridon;

        
            