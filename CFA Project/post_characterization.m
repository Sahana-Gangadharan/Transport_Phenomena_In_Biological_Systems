function post_characterization()
figure;
fileID = fopen('Firing frequency.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);
T = linspace(0, 2000, length(P));
plot(T,P);
title('Firing frequency with injected current');
xlabel('I');
ylabel('f');

figure;
fileID = fopen('Input resistance.txt','r');
Q = fscanf(fileID, '%f');
fclose(fileID);
R = linspace(0.0055,0.0245, length(Q));
plot(R,Q);
title('Input Resistance');
xlabel('Current');
ylabel('POST.Rin');

figure;
fileID = fopen('Maximum voltage.txt','r');
A = fscanf(fileID, '%f');
fclose(fileID);
B = linspace(0.0055,0.0245, length(Q));
plot(B,A);
title('V-I Characteristics');
xlabel('Current');
ylabel('POST.v(max)');

dely=A(10)-A(5);
delx=B(10)-B(5);
slope = dely/delx;

fprintf("Input Resistance (Slope of VI Characteristics) = %f\n",slope);

end


