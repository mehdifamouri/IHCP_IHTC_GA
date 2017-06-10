%function GA
clc
clear all
format long eng
%========== GENETIC  PARAMETER =====================
NS=30;
NG=30;
NP=4;
zigma=.01*100;
NN=3;
PR=.05;
PM=.1;
PC=.98;
RC=.9;

AU(1)=1700+50;AL(1)=1700-50;
AU(2)=-.47+.05;AL(2)=-.47-.05;
AU(3)=1000+50;AL(3)=1000-50;
AU(4)=-.47+.05;AL(4)=-.47-.05;

NSPR=round(NS*PR);
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
TIME=DATACONDUC(22)*(DATACONDUC(21)-1.)

DATACONDUC(23)=1*10^(-3);   %DX

DATACONDUC(24)=20*10^(-3);  %Lxm
DATACONDUC(25)=10*10^(-3);  %Lxr
DATACONDUC(26)=30*10^(-3);  %Lym
DATACONDUC(27)=50*10^(-3);  %Lyc
%=========================================================================
P(1)=1700;
P(2)=-.47;
P(3)=1000;
P(4)=-.47;
% P(1)=1700;
% P(2)=-9;
% P(3)=1000;
% P(4)=-5.5;
%=========================================================================
XYSENSOR=[10*.001,6*.001,1
    1*.001,30*.001,2
    1*.001,34*.001,3];

 XYSENSOR=[10*.001,25*.001,1
     10*.001,15*.001,2
     5*.001,40*.001,3];
Q=size(XYSENSOR);
NSENSOR=Q(1);
%=========================================================================
[Tc,Tm,Tr]=DIRECTSOLUTION(P,DATACONDUC);
TE=REFRENCESOLUTION(Tc,Tm,Tr,DATACONDUC,zigma,XYSENSOR);
ARMS=ARMS(TE,Tc,Tm,Tr,DATACONDUC,XYSENSOR)

%GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
A=INTITALPOPULATION(TE,DATACONDUC,P,XYSENSOR,NS,NP,NN,AU,AL);
for K=1:NG
    A=REALTIVEFITTNESS(A,NS,NP);
    A=TOURNOMENTSELECTION(NS,NP,A);
    ANEW=CROOSOVER(A,NS,NP,PC,AU,AL);
    ANEW=MOTTATION(ANEW,AU,AL,PM,NS,NP);
    ANEW=FITTNESSCACULATION(TE,DATACONDUC,P,XYSENSOR,ANEW,NS,NSPR,NP,AU,AL);
    ANEW=FINALSELECTION(A,ANEW,NS,NP,NSPR);
    %==========================================================================
    q=0;q(1:NP)=A(1,1:NP);MAX=A(1,NP+3);AVE=A(2,NP+3); q=[K,q,AVE,MAX,(1/MAX-.001)^2];q=q'
    A=0;A=ANEW;
    if (K ==1)
        DATAPRINT=q';
    else
        DATAPRINT=[DATAPRINT;q'];
    end
    %======================================================================
    if (K > 2 )
        AU(1:NP)=(1-RC)*A(1,1:NP)+RC*AU(1:NP);
        AL(1:NP)=(1-RC)*A(1,1:NP)+RC*AL(1:NP);
        qq=[AU;AL]
    end
    %======================================================================
end
%GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

q