function spike_time()

C = zeros(1,1000);
for i=1:500
    C(i)=0;
end
for i=500:1500
    C(i)=0.39;
end
for i=1500:2500
    C(i)=0.5;
end
for i=2500:3500
    C(i)=0.46;
end
for i=3500:4500
    C(i)=0.37;
end
for i=4500:5500
    C(i)=0.4;
end
for i=5500:6000
    C(i)=0;
end

figure;
plot(C);
title('Input Stimulus at soma of presynaptic neuron - IClamp');
xlabel('Time scale (ms)');
ylabel('Current (nA)');

fileID = fopen('STimes.txt','r');
P = fscanf(fileID, '%f');
fclose(fileID);

n=length(P);

A=zeros(1,n);
for i=1:n
    A(round(P(i)))=1;
end

figure;
histogram(A);

Gaussian1=zeros(1,401);
sum=0;
for i=1:401
    Gaussian1(i)= exp(-(i-200)^2/(2*50*50));
    sum=sum+Gaussian1(i);
end

for i=1:401
    Gaussian1(i)=Gaussian1(i)/sum;
end
figure;
plot(Gaussian1);
title('Gaussian generated');
xlabel('Time scale');
ylabel('Normalised gaussian');

Output=1000*conv(A,Gaussian1);
figure;
plot(Output);
title('Instantaneous Firing frequency');
xlabel('Time');
ylabel('Firing frequency');
end
