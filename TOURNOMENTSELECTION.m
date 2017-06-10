function AA=TOURNOMENTSELECTION(NS,NP,A)
BB(1)=A(1,NP+2);
for I=2:NS
    BB(I)=BB(I-1)+A(I,NP+2);
end
for I=1:2:NS/2
    IA=1;IB=1;
    while IA ==IB
        IA=1;IB=1;
        R1= random('unif',0,2*pi);R2= random('unif',0,2*pi);
        for i=2:NS-1
            if (R1>=BB(i)) && (R1 <= BB(i+1)); IA=i+1; end;
        end
        for i=2:NS-1
            if (R2>=BB(i)) && (R2 <= BB(i+1)); IB=i+1; end;
        end
    end
    A(I,NP+3+1)=IA;A(I+1,NP+3+1)=IB;
end

for I=1:2:NS
    IA=1;IB=1;
    while (IA == IB)
        R1= random('unif',1,NS);R2= random('unif',1,NS);R3= random('unif',1,NS);R4= random('unif',1,NS);
        IRA1=round(R1);IRA2=round(R2);IRB1=round(R3);IRB2=round(R4);
        if (A(IRA2,NP+1)> A(IRA1,NP+1)); IRA1=IRA2; end;
        if (A(IRB2,NP+1)> A(IRB1,NP+1)); IRB1=IRB2; end;
        IA=IRA1;IB=IRB1;
    end
    A(I,NP+3+1)=IA;A(I+1,NP+3+1)=IB;
end
AA=A;