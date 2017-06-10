clc
clear all
format short eng
%=====================================
DATACONDUC(1)=33;           %KcL
DATACONDUC(2)=63;           %KcS
DATACONDUC(3)=243;          %CPcL
DATACONDUC(4)=209;          %CPcS
DATACONDUC(5)=7840;         %ROcS
DATACONDUC(6)=7480;         %ROcL
DATACONDUC(7)=216+273;      %TS
DATACONDUC(8)=232+273;      %TL
DATACONDUC(9)=56140;        %HL
DATACONDUC(10)=7832;        %ROm
DATACONDUC(11)=434;         %CPm
DATACONDUC(12)=63.9;        %Km
DATACONDUC(13)=2800;        %ROr
DATACONDUC(14)=200;         %CPr
DATACONDUC(15)=1.6;         %Kr
DATACONDUC(16)=300+273;     %Tinitial
DATACONDUC(17)=23+273;      %Tambient
DATACONDUC(18)=1+273;       %Twater
DATACONDUC(19)=5;           %Ha
DATACONDUC(20)=30;          %Hw
DATACONDUC(21)=200+1;        %NT
DATACONDUC(22)=1;          %DT
TIME=DATACONDUC(22)*(DATACONDUC(21)-1.);
DATACONDUC(23)=1*10^(-3);   %DX
DATACONDUC(24)=20*10^(-3);  %Lxm
DATACONDUC(25)=10*10^(-3);  %Lxr
DATACONDUC(26)=30*10^(-3);  %Lym
DATACONDUC(27)=50*10^(-3);  %Lyc
%=========================================================================
NT=DATACONDUC(21);
P(1)=1700;
P(2)=-.47;
P(3)=1000;
P(4)=-.47;
%=========================================================================
XYSENSOR=[10*.001,6*.001,1
    0*.001,30*.001,2
    0*.001,34*.001,3];
Q=size(XYSENSOR);
NSENSOR=1;
%=========================================================================
Epsilon=10^(-5);

%==========
P1=P;P1(1)=P(1)+Epsilon*P(1);
P2=P;P2(2)=P(2)+Epsilon*P(2);
% P3=P;P3(3)=P(3)+Epsilon*P(3);
% P4=P;P4(4)=P(4)+Epsilon*P(4);

% [Tc3,Tm3,Tr3]=DIRECTSOLUTION(P3,DATACONDUC);
% [Tc4,Tm4,Tr4]=DIRECTSOLUTION(P4,DATACONDUC);
  [Tc,Tm,Tr]=DIRECTSOLUTION(P,DATACONDUC);
 [Tc1,Tm1,Tr1]=DIRECTSOLUTION(P1,DATACONDUC);
  [Tc2,Tm2,Tr2]=DIRECTSOLUTION(P2,DATACONDUC);
D=[0];
ij=0;
ii=0
for xxx=1:2:30
    ii=ii+1;
    jj=0;
    for yyy=0:5:50
        XYSENSOR=[xxx*.001,yyy*.001,1]
        jj=jj+1;
%        DATACONDUC(16)=240+SHT+273;     %Tinitial
      

        TE=REFRENCESOLUTION(Tc,Tm,Tr,DATACONDUC,0,XYSENSOR);
        TE1=REFRENCESOLUTION(Tc1,Tm1,Tr1,DATACONDUC,0,XYSENSOR);
        TE2=REFRENCESOLUTION(Tc2,Tm2,Tr2,DATACONDUC,0,XYSENSOR);
        X=[0];
        for J=1:2
            if (J==1);TEP=TE1;end;
            if (J==2);TEP=TE2;end;
            ik=0;
            for K=2:NT
                for I=1:NSENSOR
                    ik=ik+1;
                    x=0;
                    x=(TEP(K,I)-TE(K,I))/(Epsilon*P(J));
                    x=x*P(J)/(DATACONDUC(16)-DATACONDUC(18));
                    X(ik,J)=x;
                end
            end
        end
        F=X'*X;
        DD(ii,jj)=det(F)
    end
end