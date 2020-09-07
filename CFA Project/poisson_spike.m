function poisson_spike()
x = 0.001:0.001:1;
r = 0*sin(x) + 100;
z=1000;
X = zeros(z,(1000));
% P{1 spike in dt} = r(t)*dt.
%dt= 0.001 in our case. Hence P{} = r(t)*0.001
P = 0.001*r;
d = zeros(1,(1000));
for k=1:z
    for i=1:(1000)
        d(i)=rand();
        if d(i)<= P(i)
            X(k,i) = 1;
        end
    end
end
A = sum(X);
figure;
histogram(A);
%figure;
%plot(A);
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

b = mean(m)
c = var(m)


r = mean(Q)
s = var(Q)
end