function ANEW=FINALSELECTION(A,ANEW,NS,NP,NSPR)

for I=1:NSPR
    B(I,1:NP)=A(I,1:NP);
    B(I,NP+1)=A(I,NP+1);
end
% for I=NSPR+1:NSPR+2
%     B(I,1:NP)=ANEW(NS-(NSPR+2-I),1:NP);
%     B(I,NP+1)=ANEW(NS-(NSPR+2-I),NP+1);
% end
for I=NSPR+1:NS
    B(I,1:NP)=ANEW(I-(NSPR+1)+1,1:NP);
    B(I,NP+1)=ANEW(I-(NSPR+1)+1,NP+1);
end
ANEW(1:NS,1:NP+1)=B(1:NS,1:NP+1);
ANEW=sortrows(ANEW,-(NP+1));
