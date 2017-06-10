function A=INTITALPOPULATION(TE,DATACONDUC,P,XYSENSOR,NS,NP,NN,AU,AL)
for I=1:NS*NN
    for J=1:NP     
        BB(I,J)=random('unif',AL(J),AU(J));
    end
end
%========
for I=1:NS*NN
    GENDATA(1:NP)=BB(I,1:NP);
    BF(I,1)=FITTNESFUNCTION(TE,P,DATACONDUC,GENDATA,NP,XYSENSOR);
end
%=========
BB=[BB,BF];
BB=sortrows(BB,-(NP+1));
A(1:NS,1:NP+1)=BB(1:NS,1:NP+1);