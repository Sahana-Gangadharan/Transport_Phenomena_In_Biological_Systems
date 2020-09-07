function poissonQuanta()
%To verify the quanta release, with frequency of r(t).
x = 0.001:0.001:100; %dt = 0.001 sec or 1 ms. Total time = 100 secs.
r = 0*sin(x) +80; %Tiem dependant function -frequency = 500 Hz.
z=10; %number of trials= 10
X = zeros(z,(10^5)); 
% P{1 spike in dt} = r(t)*dt.
P = 0.001*r;

d = zeros(1,(10^5));

%Poisson spike generation
for k=1:z
    for i=1:(10^5)
        d(i)=rand();
        if d(i)<= P(i)
            X(k,i) = 1;
        end
    end
end
%Histogram of summed up spike trains is plotted.
A = sum(X);
figure;
histogram(A);
figure;
plot(A);
end