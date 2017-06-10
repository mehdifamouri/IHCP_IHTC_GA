function ANEW=CROOSOVER(A,NS,NP,PC,AU,AL)
for I=1:2:NS
    JS=round(random('unif',1,NP));%JS=1;
    JE=round(random('unif',1,NP));%JE=NP;   %  for np=2
    if (JS>JE)
        B1=JE;JE=JS;JS=B1;
    end
    IA=A(I,NP+4);IB=A(I+1,NP+4);
    ANEW(I,1:NP)=A(IA,1:NP);
    ANEW(I+1,1:NP)=A(IB,1:NP);
    for J=JS:JE
        B1=A(IA,J);
        B2=A(IB,J);
        a=1;ia=0;
        while a == 1
            ia=ia+1;a=-1;
            R=random('unif',0,1);
            ANEW(I,J)=(B1+B2)/2.+abs(B1-B2)*R;
            ANEW(I+1,J)=(B1+B2)/2.-abs(B1-B2)*R;
            if (ANEW(I,J)> AU(J) );a=1;end;
            if (ANEW(I,J)< AL(J) );a=1;end;
            if (ia == 20) 
                ANEW(I,J)=random('unif',AL(J),AU(J));
                a=-1;
            end
            if (ANEW(I+1,J)> AU(J) );a=1;end;
            if (ANEW(I+1,J)< AL(J) );a=1;end;
            if (ia == 20) 
                ANEW(I+1,J)=random('unif',AL(J),AU(J));
                a=-1;
            end
        end
    end

end
