% %random w3
% %V = niftiread('Copia de coronacases_org_001.nii');
% 
% tamCapa=20;
% tamSalida=3;
% tamEntrada=4;
% w3=randi([-3,3],tamEntrada,tamCapa)
% w2=randi([-3,3],tamCapa,tamCapa)
% w1=randi([-3,3],tamCapa,tamSalida)
% w33=w3;
% w22=w2;
% w11=w1;
% a4=[1,1,0,1];
% y=[0,1,0];
% a1=[99,99,99];
% 
% 
% %vd=1:4;
% %vd(1)=2*(a1-y);
% %vd(2)=functionActD(a1,w1,2);
% %vd(3)=functionActD(a2,w2,2);
% %vd(4)=functionActD(a3,w3,2);
% 
% %vvd=1:3;
% %vvd(1)=functionActD(a1,w1,1); %da1/a2
% %vvd(2)=functionActD(a2,w2,1); %da2/a3
% %vvd(3)=functionActD(a3,w3,1); %da3/a4
% 
% lr=0.01;
% a3=funcionAct(a4*w3);
% a2=funcionAct(a3*w2);
% a1=funcionAct(a2*w1);
% while dot(a1-y,a1-y)>0
% 
% 
% %optimo w1
% q=lr*functionActD(a1',w1,2)*2*dot(a1-y,a1-y);
% w1=w1-q;
% %optimo w2
% qq=lr*2*dot(a1-y,a1-y)*functionActD(a2,w2,1)*functionActD(a3',w2,2);
% w2=w2-qq;
% 
% %optimo w3
% qqq=functionActD(a4',w3',2);
% 
% qqq=qqq*(lr*2*dot(a1-y,a1-y)*functionActD(a2,w1',1)*functionActD(a3,w2,1)');
% w3=w3-qqq';
% disp(a1);
% 
% 
% a3=funcionAct(a4*w3);
% a2=funcionAct(a3*w2);
% a1=funcionAct(a2*w1);
% end


%random w3
%V = niftiread('Copia de coronacases_org_001.nii');

tamCapa=6;
tamSalida=3;
tamEntrada=4;
w3=randi([-3,3],tamEntrada,tamCapa);
w2=randi([-3,3],tamCapa,tamCapa);
w1=randi([-3,3],tamCapa,tamSalida);
w33=w3;
w22=w2;
w11=w1;
a4=[0.3,3.2,0.1,2.3];
y=[0,1,1];
a1=[1,0,0];

%vd=1:4;
%vd(1)=2*(a1-y);
%vd(2)=functionActD(a1,w1,2);
%vd(3)=functionActD(a2,w2,2);
%vd(4)=functionActD(a3,w3,2);

%vvd=1:3;
%vvd(1)=functionActD(a1,w1,1); %da1/a2
%vvd(2)=functionActD(a2,w2,1); %da2/a3
%vvd(3)=functionActD(a3,w3,1); %da3/a4

lr=0.1;


while dot(a1-y,a1-y)>0

a3=funcionAct(a4*w3);
a2=funcionAct(a3*w2);
a1=funcionAct(a2*w1); 
    
%optimo w1
q=-1*lr*functionActD(a1',w1,2)*2*diag(a1-y);
w1=w1-q;

%optimo w2
x=randi([0,0],6,6);
z=(a1-y);
x(1,1)=z(1);
x(2,2)=z(2);
x(3,3)=z(3);

qq=-1*x*lr*2*functionActD(a3',w2,2)*diag(functionActD(a2,w2,1));
w2=w2-qq;

%optimo w3

xx=randi([0,0],6,4);
zz=(a1-y);
xx(1,1)=z(1);
xx(2,2)=z(2);
xx(3,3)=z(3);

qqq=-1*functionActD(a4',w3',2)*(lr*2*functionActD(a2,w1',1)*functionActD(a2,w1',1)');
qqq=qqq.*xx;
w3=w3-qqq';

a3=funcionAct(a4*w3);
a2=funcionAct(a3*w2);
a1=funcionAct(a2*w1);

dot(a1-y,a1-y)
a1
end



