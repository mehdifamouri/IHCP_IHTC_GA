NG=1000;
AU(1)=1000;
AL(1)=100;
RC=.9;
AU(2)=0;
AL(2)=-1;

for i=1:NG

    

    AU(1:2)=(1-RC)*Best(1:2)+RC*AU(1:2);
    AL(1:2)=(1-RC)*Best(1:2)+RC*AL(1:2);

end