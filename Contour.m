ii=0;
AA=0.;
AAA=0.
DX=DATACONDUC(23);

Lxm=DATACONDUC(24);
Lxr=DATACONDUC(25);
Lym=DATACONDUC(26);
Lyc=DATACONDUC(27);

Lxc=Lxm;
Lyr=Lym+Lyc;
Nxm=fix((Lxm/DX)+1);
Nxr=fix((Lxr/DX)+1);
Nxc=Nxm;
Nym=fix((Lym/DX)+1);
Nyc=fix((Lyc/DX)+1);
Nyr=fix((Lyr/DX)+1);
for I=1:Nxc
    for J=1:Nyc
        ii=ii+1;
        AA(ii,1)=(I-1)*DX;
        AA(ii,2)=(J-1)*DX;
        AA(ii,3)=Tc(5,I,J);
    end
end
ii=0;
I=fix(Nxc/3);
J=fix(Nyc/3);
%I=10;
%J=4;
for K=1:NT
    ii=ii+1;
    AAA(ii,1)=(K-1)*DT;
    AAA(ii,2)=Tc(K,I,J);
end