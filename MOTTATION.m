function ANEW=MOTTATION(ANEW,AU,AL,PM,NS,NP)
for I=1:NS
    for J=1:NP
        R=random('unif',0,1);
        if (R<PM)
            R=random('unif',0,1);
            ANEW(I,J)=(ANEW(I,J)+R*(AU(J)-AL(J))+AL(J))/2.;
        end
    end
end