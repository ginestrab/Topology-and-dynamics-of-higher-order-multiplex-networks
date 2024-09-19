clear B MB B2 MB2 G0 G1 G2


n1=1;
n2=2;
delta0=0;
delta1=0.9;% delta<1
delta2=0.9;
theta0=0.5;





[I,J,V]=find(triu(A{n1}+A{n2}));
L=numel(V);
m=zeros(L,1);
n=n1;
[In,Jn,Vn]=find(triu(A{n}));
B{1}=zeros(N,L);
B{2}=zeros(N,L);
for el=1:numel(Vn),
[El,Vl]=find((I==In(el)).*(J==Jn(el)));
elp=El(1);
B{1}(I(elp),elp)=1;
B{1}(J(elp),elp)=-1;
m(elp)=m(elp)+1;
end
n=n2;
[In,Jn,Vn]=find(triu(A{n}));
for el=1:numel(Vn),
[El,Vl]=find((I==In(el)).*(J==Jn(el)));
elp=El(1);
B{2}(I(elp),elp)=1;
B{2}(J(elp),elp)=-1;
m(elp)=m(elp)+2;
end

MB([1:N],[1:L])=B{1};
MB([N+1:2*N],[L+1:2*L])=B{2};


Multilinks{in,1,1}=nnz(m==1);
Multilinks{in,2,1}=nnz(m==2);
Multilinks{in,3,1}=nnz(m==3);

Ag=1.*((A{n1}+A{n2})>0);

[Ig,Jg,V]=find(tril(A{n1}+A{n2}));
T=0;

    for i=1:N,
        for j=i+1:N,
            for k=j+1:N,
        if ((Ag(i,j)*Ag(j,k)*Ag(k,i)==1)),
            T=T+1;
            y=sort([i,j,k]);
            Scag(T,:)=sort([y(1),y(2),y(3)]);      
        end
        end
    end
end
mn=zeros(N,1);
mt=zeros(T,1);
B2{1}=zeros(L,T);
B2{2}=zeros(L,T);
for ni=1:2,
    nx=n1;
    if (ni==2),
        nx=n2;
    end
        degree=sum(A{nx});
  
    for i=1:N,
        if(degree(i)>0),
            mn(i)=mn(i)+ni;
        end
    end
        for n=1:T0(ni),
            
                y=sort(SC{ni,3}(n,:));
                
                [El,Vl]=find((Scag(:,1)==y(1)).*(Scag(:,2)==y(2)).*(Scag(:,3)==y(3)));
                tp=El(1);
                [El,Vl]=find((I==y(2)).*(J==y(3)));
                elp=El(1);
                B2{ni}(elp,tp)=1;
                [El,Vl]=find((I==y(1)).*(J==y(3)));
                elp=El(1);
                B2{ni}(elp,tp)=-1;
                [El,Vl]=find((I==y(1)).*(J==y(2)));
                elp=El(1);
                B2{ni}(elp,tp)=1;
                mt(tp)=mt(tp)+ni;
            
        end
   
end

Multilinks{in,1,2}=nnz(mt==1);
Multilinks{in,2,2}=nnz(mt==2);
Multilinks{in,3,2}=nnz(mt==3);
Nlayer{in,1}=nnz(mn==1);
Nlayer{in,2}=nnz(mn==2);
Nlayer{in,3}=nnz(mn==3);

MB2([1:L],[1:T])=B2{1};
MB2([L+1:2*L],[T+1:2*T])=B2{2};
