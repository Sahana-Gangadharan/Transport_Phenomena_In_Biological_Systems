function spike()

figure;
fileID = fopen('PoissonSpike.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0, 80000, length(P));
plot(T,P);
title('Poisson spike train');
xlabel('Time');
ylabel('Vescicular release');

%Plotting a histogram for Poisson spike trains
figure;
histogram(P);
title('Histogram of Poisson spike train');
xlabel('Number of vesicles released simultaneously');
ylabel('Vescicular release');
end
    
        
