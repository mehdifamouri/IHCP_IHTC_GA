function  AA=REALTIVEFITTNESS(A,NS,NP)
b=max(A);
AMAXFITTNES=b(NP+1);
b=mean(A);
AVERFITTNES=b(NP+1);
b=sum(A);
SUM1=b(NP+1);
SUM2=sum(1:NS);
for I=1:NS
    AFP(I)=A(I,NP+1)/SUM1*2*pi;
    %AFP(I)=(NS+1-I)/SUM2*2*pi;
end
AFP=AFP';
B(1:NS,1)=0.;B(2,1)=AVERFITTNES;B(1,1)=AMAXFITTNES;
AA=[A,AFP,B];