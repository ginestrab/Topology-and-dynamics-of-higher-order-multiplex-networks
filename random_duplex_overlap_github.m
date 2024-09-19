clear B2 B1 SC T0 a a2 G2 G1 G0 mn mt m
N=40;
p1=12/N^2;
p2=p;
L=[0,0];
T0=[0,0];
M=2;
a=zeros(N,N);
a2=zeros(N,N);
SC{1,1}=[1:N]';
SC{2,1}=[1:N]';
for i=1:N,
    for j=1+i:N,
           for k=j+1:N,
            if(rand(1)<p1)
                a(i,j)=1;
                a(j,k)=1;
                a(k,i)=1;
                a(j,i)=1;
                a(k,j)=1;
                a(i,k)=1;
                T0(1)=T0(1)+1;
                SC{1,3}(T0(1),:)=[i,j,k];
                if (rand(1)<p2)
                    a2([i,j,k],[i,j,k])=a([i,j,k],[i,j,k]);
                    T0(2)=T0(2)+1;
                    SC{2,3}(T0(2),:)=[i,j,k];
                end
            end
        end
    end
end
A{1}=a;
A{2}=a2;
T=T0(1);
[I,J,V]=find(a);
for n=1:numel(V);
L(1)=L(1)+1;
SC{1,2}(n,1)=I(n);
SC{1,2}(n,2)=J(n);
end
[I,J,V]=find(a2);
for n=1:numel(V);
L(2)=L(2)+1;
SC{2,2}(n,1)=I(n);
SC{2,2}(n,2)=J(n);
end
