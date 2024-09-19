count=0;
for i2=1:19
    delta2=0.1*(i2)-1;
    for i1=1:19
        delta1=0.1*(i1)-1;

G2=zeros(2*T,2*T);
for n=1:T,
    if(mt(n)==1)
        G2(n,n)=1;
    end
    if (mt(n)==2)
        G2(n+T,n+T)=1;
    end
    if(mt(n)==3),
        G2(n,n)=1/sqrt(1-delta2^2);
        G2(n+T,n+T)=1/sqrt(1-delta2^2);
        G2(n,n+T)=delta2/sqrt(1-delta2^2);
        G2(n+T,n)=delta2/sqrt(1-delta2^2);
    end
end
G0=zeros(2*N,2*N);
for i=1:N,
    if(mn(i)==1)
        G0(i,i)=1;
    end
    if(mn(i)==2)
        G0(i+N,i+N)=1;
    end
    if(mn(i)==3)
    G0(i,i)=1/(1-delta2^2);
    G0(i,i+N)=delta2/sqrt(1-delta2^2);
    G0(i+N,i)=delta2/sqrt(1-delta2^2);
    G0(i+N,i+N)=1/sqrt(1-delta2^2);
    end
end
G1=zeros(2*L,2*L);
for n=1:L,
    if(m(n)==1)
        G1(n,n)=1;
    end
    if (m(n)==2)
        G1(n+L,n+L)=1;
    end
    if(m(n)==3),
        G1(n,n)=1/sqrt(1-delta1^2);
        G1(n+L,n+L)=1/sqrt(1-delta1^2);
        G1(n,n+L)=(delta1)/sqrt(1-delta1^2);
        G1(n+L,n)=(delta1)/sqrt(1-delta1^2);
    end
end

L1up=pinv(G1)*MB2*G2*transpose(MB2);
L1down=transpose(MB)*pinv(G0)*MB*G1;
lambda=sort(real(eig(L1up)));
[I,J,V]=find(lambda.*(lambda>10^(-5)));
V2=V;
if(numel(V2)>0)
lambda1up(i1,i2)=V(1);
end
lambda=sort(real(eig(L1down)));
[I,J,V]=find(lambda.*(lambda>10^(-5)));


lambda1down(i2,i1)=V(1);

X0(i2,i1)=delta2;
X1d(i2,i1)=delta1;
X1(i1,i2)=delta1;
X2(i1,i2)=delta2;
    end
end
Fiedler_delta_s{in,1}=lambda1down;
if(numel(V2)>0)
Fiedler_delta_s{in,2}=lambda1up;
end
