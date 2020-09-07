function calciumSpikeHistogram()

figure;
fileID = fopen('PoissonSpike.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0, 6000, length(P));
plot(T,P);
title('Poisson spike train - Synaptic release');
xlabel('time');
ylabel('Vescicular release');

%Plotting a histogram for Poisson spike trains
figure;
histogram(P);
title('Synaptic release histogram');
xlabel('time');
ylabel('Vescicular release');

end
    
        
