function synaptic_current()
figure;
fileID = fopen('Synaptic current.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0, 6000, length(P));
plot(T,P);
title('Synaptic current');
xlabel('time');
ylabel('syn.i');

figure;
fileID = fopen('Postsynaptic voltage.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0,6000, length(P));
plot(T,P);
title('Postsynaptic voltage');
xlabel('time');
ylabel('POST.v(0.5)');

end
