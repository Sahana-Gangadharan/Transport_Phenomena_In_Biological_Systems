function post_ff()

figure;
fileID = fopen('POST Firing frequency.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0.1,1 , length(P));
plot(T,P);
title('Firing frequency as current amplitude increases.');
xlabel('Current (nA)');
ylabel('Post Firing frequency')
end