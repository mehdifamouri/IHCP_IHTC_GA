function FITTNES=FITTNESFUNCTION(TE,P,DATACONDUC,GENDATA,NP,XYSENSOR)

P(1)=GENDATA(1);         % P1
P(2)=GENDATA(2);         % P2
P(3)=GENDATA(3);         % P3
P(4)=GENDATA(4);         % P4
% ======================================================================
[Tc,Tm,Tr]=DIRECTSOLUTION(P,DATACONDUC);
B1=ARMS(TE,Tc,Tm,Tr,DATACONDUC,XYSENSOR);
FITTNES=1/(.001+sqrt(B1));
%========================================================================