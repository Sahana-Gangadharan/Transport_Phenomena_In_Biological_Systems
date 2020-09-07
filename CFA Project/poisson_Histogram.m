function poisson_Histogram()
%To verify the conditions of Poisson distributions.

%Verification 1 - hist(A) should be exp decay for homogeneous Poisson

x = 0.001:0.001:1; %dt = 0.001 sec or 1 ms. Total time = 1 sec.
r = 0*sin(x) + 70; %Time dependant function - frequency = 100 Hz.
z=1000; %Total trials plotted.
X = zeros(z,(1000)); %Matrix to hold the poisson spike trains.
% P{1 spike in dt} = r(t)*dt.
P = 0.001*r;
d = zeros(1,(1000)); % vector for random variable

%Poisson spike generation
for k=1:z
    for i=1:(1000)
        d(i)=rand();
        if d(i)<= P(i)
            X(k,i) = 1;
        end
    end
end

%Summed up histogram should give us an exponential decay for unifrom
%poisson distribution. 
%A = sum(X);
%figure;
%histogram(A);

% Verification 2 - Histogram of summed up ISI is plotted. Graph will be an exponential decay.
cnt=1;
for j=1:z
    B = find(X(j,:)); %Finds spikes
    n = size(B); 
    p = n(2)-1;
    for k = 1:p
        Q(cnt)=B(k+1)-B(k); %ISI
        cnt = cnt+1;
    end
end
figure;
histogram(Q);
title('ISI Histogram');
xlabel('Total time');
ylabel('Summed up ISI');

% Verification 3 - Vector m will have a count of spikes on each trial and plot its
% distribution. Should be gaussian.
m=zeros(z,1);

for i = 1:z
    for k=1:1000
        if X(i,k)~=0
            m(i) = m(i)+1;
        end
    end
end
figure;
histogram(m);
title('Total SpikeCount distribution');
xlabel('Total time');
ylabel('Number of quantas released');

% Verification 3.5 - Mean and Variance of the above gaussian distribution should be
%approximately the same.
spike_mean = mean(m);
spike_var = var(m);
fprintf("Mean = %f and Variance = %f of spike count histogram\n",spike_mean,spike_var);

%Mean and SD of ISI histogram should be approx same.
isi_mean = mean(Q);
isi_var = var(Q);
fprintf("Mean = %f and Variance = %f of spike count histogram\n",isi_mean,isi_var);
end