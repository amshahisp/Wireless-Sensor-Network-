tic
%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Field Dimensions - x and y maximum (in meters)/ Tarife Size mohite shabake(m)
xm=200;
ym=200;
%x and y Coordinates of the Sink
sink.x=xm;
sink.y=ym;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%BS location
BSX=100;
BSY=150;
%Number of Nodes inthe field  / Tedade Node haye shabake
C1Tn=100;
%No's Data packets 
TTDP=0;DTDP=0;BTDP=0;HTDP=0;
%Optimal Election Probability of a node to become cluster head/ Ehtemale Entekhab Node be onvane Cluster Head
p=0.1;
%Energy Model (all values in Joules)/ Energy ha bar hasbe Joule
%Initial Energy / Energy Avaliye
Eo=2;
SimulatioTime=0;
%Eelec=Etx=Erx       
ETX=50*0.000000001;
ERX=50*0.000000001;
%Transmit Amplifie7*---------*-/-r types / Ghodrate Ersal
Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;
%Data Aggregation Energy/ Energy Masrafi Tajmie Dade
EDA=5*0.000000001;
K=4000;
%Values for Hetereogeneity
%Percentage of nodes than are advanced
m=0.1;
%\alpha
a=1;
%temprature range
Ti=90;Di=90;Bi=90;Hi=90;
Tf=105;Df=105;Bf=105;Hf=105;
%Thresholods
THT=105;DHT=105;BHT=105;HHT=105;   %%%%%%Hard Thres%%%%hold H(t)
TST=100;DST=100;BST=100;HST=100;   %%%%%%Soft thres%%%%hold  S(t)
TPSV=0;DPSV=0;BPSV=0;HPSV=0;                 %%%%%%previously Sensed value S(v)
%TCSV=0;       %%%%%Current Sensed Vale.
%maximum number of rounds/ Max tedade round ha
TncRT=[];DncRT=[];BncRT=[];HncRT=[];
TcRT=[];DcRT=[];BcRT=[];HcRT=[];
xtocT=[];
aliveT=[];
ARET=[];
TEDT=[];
TTDT=[];
TAEDT=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%END OF PARAMETERS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Creation of the random Sensor Network/ Tolide Randome shabake
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%figure(1)
for i=1:1:C1Tn
    S(i).xd=rand(1,1)*xm;
    XR(i)=S(i).xd;
    S(i).yd=rand(1,1)*ym;
    YR(i)=S(i).yd;
    S(i).G=0;
    %initially there are no cluster heads only nodes/ Dar ebteda hich Cluster Head i mojud nist
    S(i).type='TN';
    temp_rnd0=i;
    %Random Election of Normal Nodes/ Entekhabe Tasadofi Node ha 
    S(i).E=Eo;
    S(i).ENERGY=0;
figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
    hold on;
    %Random Election of Advanced Nodes/ Entekhab Tasadofie CH ha
end
S(C1Tn+1).xd=sink.x;
S(C1Tn+1).yd=sink.y;
figure(1)
plot(BSX,BSY,'o','MarkerSize', 20, 'MarkerFaceColor', 'black');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TN=0;DN=0;BN=0;HN=0;
AED=0;
TD=0;
TTD=0;DTD=0;BTD=0;HTD=0;
TAED=0;DAED=0;BAED=0;HAED=0;
TTED=0;DTED=0;BTED=0;HTED=0;
TT=0;
A=0;
rmax=2;
xtoc=0;
ARE=0;
TRE=0;
for r=1:1:7000
Talive=100;
%fprintf('lon g  round')
%current sensed value
TNED=0;DNED=0;BNED=0;HNED=0;
TTNED=0;DTNED=0;BTNED=0;HTNED=0;
ATNED=0;DTNED=0;BTNED=0;HTNED=0;
%;Dalive=25;Balive=25;Halive=25;
Tncdist=0;Dncdist=0;Bncdist=0;Hncdist=0;
Tcdist=0;Dcdist=0;Bcdist=0;Hcdist=0;
%TCSV = tempi + (tempf-tempi).*rand(1,1)%%%%%%Current sensing value C(v)
TcNNH=[0];TcNH1=[];TcNH2=[];TcNH3=[];TcNH4=[];TcNH5=[];TcNH6=[];TcNH7=[];TcNH8=[];
TcNH9=[];TcNH10=[];TcNH11=[];TcNH12=[];TcNH13=[];
TncNNH=[0];TncNH1=[];TncNH2=[];TncNH3=[];TncNH4=[];TncNH5=[];TncNH6=[];TncNH7=[];TncNH8=[];
TncNH9=[];TncNH10=[];TncNH11=[];TncNH12=[];TncNH13=[];
TncRT=[];TcRT=[];
TncPOV=0;
TcPOV=0;
DcNNH=[0];DcNH1=[];DcNH2=[];DcNH3=[];DcNH4=[];DcNH5=[];DcNH6=[];DcNH7=[];DcNH8=[];
DncNNH=[0];DncNH1=[];DncNH2=[];DncNH3=[];DncNH4=[];DncNH5=[];DncNH6=[];DncNH7=[];DncNH8=[];
DncRT=[];DcRT=[];
DncPOV=0;
DcPOV=0;
BcNNH=[0];BcNH1=[];BcNH2=[];BcNH3=[];BcNH4=[];BcNH5=[];BcNH6=[];BcNH7=[];BcNH8=[];
BncNNH=[0];BncNH1=[];BncNH2=[];BncNH3=[];BncNH4=[];BncNH5=[];BncNH6=[];BncNH7=[];BncNH8=[];
BncRT=[];BcRT=[];
BncPOV=0;
BcPOV=0;
%%%%H 
HcNNH=[0];HcNH1=[];HcNH2=[];HcNH3=[];HcNH4=[];HcNH5=[];HcNH6=[];HcNH7=[];HcNH8=[];
HncNNH=[0];HncNH1=[];HncNH2=[];HncNH3=[];HncNH4=[];HncNH5=[];HncNH6=[];HncNH7=[];HncNH8=[];
HncRT=[];HcRT=[];
HncPOV=0; 
HcPOV=0;
TTRE=0;
TRE=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%for C1Tn%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:C1Tn
    TPOM=[];
    if (S(i).E>0)
    if(S(i).E>0.4)
%fprintf('Enery available')
TCSV= Ti + (Tf-Ti).*rand(1,1);
%%%%%%Current sensing value C(v)
%Checking data on the basis of CRITICAL & NON-CRITICAL
if (S(i).yd~=TcNNH)
%fprintf('i======N0NH')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
if (DiTii>0)
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
end
end
[R C]=size(iRT);
if (R>1)
%fprintf('R>1')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
[min_val,idx]=min(iRT(:,3));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH1=[TcNH1; iRT(iR,2)];
%Tcdist=iRT(iR,3)
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
end
if (R==1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
%fprintf('R===1')
TcNH1=[TcNH1; iRT(1,2)];
%Tcdist=iRT(1,3)
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%@plot(S(i).xd,S(.i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
TcNH1=[TcNH1; ym];
%fprintf('R===0')
%Tncdist=BSY-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH1==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP1 P]=size(find(TcNH1==S(i).yd));
%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
 DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
    if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH2=[TcNH2; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
end
if (R==1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
%%fprintf('R===1')
TcNH2=[TcNH2; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
TcNH2=[TcNH2; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH2==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP2 P]=size(find(TcNH2==S(i).yd));
%fprintf('i==========TNH2')
iRT=[]; 
for ii=i:1:C1Tn    
 DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
      if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH3=[TcNH3; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
%%fprintf('R==1')
TcNH3=[TcNH3; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
TcNH3=[TcNH3; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH3==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP3 P]=size(find(TcNH3==S(i).yd));
%fprintf('i==========TNH3')
iRT=[]; 
for ii=i:1:C1Tn    
 DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
       if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH4=[TcNH4; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
%%fprintf('R==1')
TcNH4=[TcNH4; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
TcNH4=[TcNH4; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH4==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP4 P]=size(find(TcNH4==S(i).yd));
%fprintf('i==========TNH14')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
         if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
       iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH5=[TcNH5; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
%%fprintf('R==1')
TcNH5=[TcNH5; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
TcNH5=[TcNH5; ym];
%Tcdist=ym-S(i).yd;S)_
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH5==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP5 P]=size(find(TcNH5==S(i).yd));
%fprintf('i==========TNH5')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
        end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH6=[TcNH6; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
%%fprintf('R==1')black
TcNH6=[TcNH6; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
TcNH6=[TcNH6; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH6==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP6 P]=size(find(TcNH6==S(i).yd));
%fprintf('i==========TNH6')
iRT=[]; 
for ii=i:1:C1Tn    
 DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
       if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
[min_val,idx]=min(iRT(:,3));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH7=[TcNH7; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
%%fprintf('R==1')
TcNH7=[TcNH7; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
TcNH7=[TcNH7; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH7==S(i).yd))
S(i).yd;
TcNH1;
[TcNHP7 P]=size(find(TcNH7==S(i).yd));
%fprintf('i==========TNH7')
iRT=[]; 
for ii=i:1:C1Tn    
 DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
        end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');
[min_val,idx]=min(iRT(:,3));;
[iR,iC]=ind2sub(size(iRT),idx);
TcNH8=[TcNH8; iRT(iR,2)];
%Tcdist=iRT(iR,3);

Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');
%%fprintf('R==1')
TcNH8=[TcNH8; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');
TcNH8=[TcNH8; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH8==S(i).yd))
[TcNHP8 P]=size(find(TcNH8==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH9=[TcNH9; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
%%fprintf('R===1')
TcNH9=[TcNH9; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
TcNH9=[TcNH9; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH9==S(i).yd))
[TcNHP9 P]=size(find(TcNH9==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH10=[TcNH10; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
%%fprintf('R===1')
TcNH10=[TcNH10; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
TcNH10=[TcNH10; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH10==S(i).yd))
[TcNHP10 P]=size(find(TcNH10==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH11=[TcNH11; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
    %%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
%%fprintf('R===1')
TcNH11=[TcNH11; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
TcNH11=[TcNH11; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH11==S(i).yd))
[TcNHP11 P]=size(find(TcNH11==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH12=[TcNH12; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
%%fprintf('R===1')
TcNH12=[TcNH12; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
TcNH12=[TcNH12; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcNH12==S(i).yd))
[TcNHP12 P]=size(find(TcNH12==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TcNH13=[TcNH13; iRT(iR,2)];
%Tcdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
%%fprintf('R===1')
TcNH13=[TcNH13; iRT(1,2)];
%Tcdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TcRT=[TcRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
TcNH13=[TcNH13; ym];
%Tcdist=ym-S(i).yd;
Tcdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TcRT=[TcRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (S(i).E>0.0)
if (S(i).yd~=TncNNH)
%%fprintf('i======N0NH')
iRT=[]; 
for ii=i:1:C1Tn    
    S(i).yd;
    S(ii).yd;
     DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
  if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH1=[TncNH1; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tcdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
end
if (R==1)
%%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
TncNH1=[TncNH1; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
TncNH1=[TncNH1; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'r');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH1==S(i).yd))
S(i).yd;
TncNH1;
[TncNHP1 P]=size(find(TncNH1==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
       if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH2=[TncNH2; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
%%fprintf('R===1')
TncNH2=[TncNH2; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');
TncNH2=[TncNH2; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'g');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH2==S(i).yd))
[TncNHP2 P]=size(find(TncNH2==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
        end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH3=[TncNH3; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
%%fprintf('R===1')
TncNH3=[TncNH3; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');
TncNH3=[TncNH3; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'b');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH3==S(i).yd))
[TncNHP3 P]=size(find(TncNH3==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
       if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH4=[TncNH4; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
%%fprintf('R===1')
TncNH4=[TncNH4; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
TncNH4=[TncNH4; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH4==S(i).yd))
[TncNHP4 P]=size(find(TncNH4==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH5=[TncNH5; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
%%fprintf('R===1')
TncNH5=[TncNH5; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];


end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');
TncNH5=[TncNH5; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
%figure(1)
hold on 
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH5==S(i).yd))
[TncNHP5 P]=size(find(TncNH5==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH6=[TncNH6; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
%%fprintf('R===1')
TncNH6=[TncNH6; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];


end
if(R==0)
%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');
TncNH6=[TncNH6; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH6==S(i).yd))
[TncNHP6 P]=size(find(TncNH6==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[]; 
for ii=i:1:C1Tn    
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
        if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH7=[TncNH7; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
%%fprintf('R===1')
TncNH7=[TncNH7; iRT(1,2)];
%Tncdist=iRT(1,3);
Tcdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];


end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');
TncNH7=[TncNH7; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH7==S(i).yd))
[TncNHP7 P]=size(find(TncNH7==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH8=[TncNH8; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
%%fprintf('R===1')
TncNH8=[TncNH8; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];


end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'y');
TncNH8=[TncNH8; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH8==S(i).yd))
[TncNHP8 P]=size(find(TncNH8==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH9=[TncNH9; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
%%fprintf('R===1')
TncNH9=[TncNH9; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];

end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
TncNH9=[TncNH9; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH9==S(i).yd))
[TncNHP9 P]=size(find(TncNH9==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH10=[TncNH10; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
%%fprintf('R===1')
TncNH10=[TncNH10; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];


end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'm');
TncNH10=[TncNH10; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'm');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH10==S(i).yd))
[TncNHP10 P]=size(find(TncNH10==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH11=[TncNH11; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
%%fprintf('R===1')
TncNH11=[TncNH11; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'c');
TncNH11=[TncNH11; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'c');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH11==S(i).yd))
[TncNHP11 P]=size(find(TncNH11==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH12=[TncNH12; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance


end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
%%fprintf('R===1')
TncNH12=[TncNH12; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'w');
TncNH12=[TncNH12; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'w');    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TncNH12==S(i).yd))
[TncNHP12 P]=size(find(TncNH12==S(i).yd));
%%fprintf('i==========TNH1')
iRT=[];
for ii=i:1:C1Tn
DiTii=sqrt((S(ii).xd-S(i).xd)^2+(S(ii).yd-S(i).yd)^2);
 if (DiTii>0)    
if (S(i).yd<BSY)
if (S(ii).yd<BSY)
    if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
        end 
end
if (S(i).yd>BSY)
if (S(ii).yd>BSY)
     if (sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2)>sqrt((BSX-S(ii).xd)^2+(BSY-S(ii).yd)^2))
            iRT=[iRT; S(ii).xd S(ii).yd DiTii S(ii).E];
           end
end
end
      end
end
[R C]=size(iRT);
if (R>1)
%%fprintf('R>1')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
[min_val,idx]=max(iRT(:,4));
[iR,iC]=ind2sub(size(iRT),idx);
TncNH13=[TncNH13; iRT(iR,2)];
%Tncdist=iRT(iR,3);
Tncdist=sqrt((iRT(iR,2)-S(i).xd)^2+(iRT(iR,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(iR,2)];
%RT=[RT; S(i).yd];
%Optimal Routing Path Distance
end
if (R==1)
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
%%fprintf('R===1')
TncNH13=[TncNH13; iRT(1,2)];
%Tncdist=iRT(1,3);
Tncdist=sqrt((iRT(1,2)-S(i).xd)^2+(iRT(1,3)-S(i).yd)^2);
TncRT=[TncRT; S(i).yd iRT(1,2)];
end
if(R==0)
%%fprintf('R===0')
%%%figure(1)
%@plot(S(i).xd,S(i).yd,'o','MarkerSize', 5, 'MarkerFaceColor', 'black');
TncNH13=[TncNH13; ym];
%Tncdist=ym-S(i).yd;
Tncdist=sqrt((BSX-S(i).xd)^2+(BSY-S(i).yd)^2);
TncRT=[TncRT; S(i).yd ym];
end
hold on 
%figure(1)
plot(S(i).xd,S(i).yd,'o','MarkerSize', 10, 'MarkerFaceColor', 'black');    
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(find(TcRT(:,1)==S(i).yd))
%fprintf('CD  ')
%Totlal data packets
TcDP=length(find(TcRT(:,1)==S(i).yd));
%if (100<=TCSV<=105)
TPOM=[TPOM; Tcdist S(i).E 0 S(i).E];
TDP=TcDP;
end
if(find(TncRT(:,1)==S(i).yd))
%fprintf('NCD ')
%Totlal data packets
TncDP=length(find(TncRT(:,1)==S(i).yd));
%if (100>TCSV>105)
TPOM=[TPOM; 0 S(i).E Tncdist S(i).E];
TDP=TncDP;
end
if (TST<=TCSV<=THT)
%fprintf('critical data')
Tdist=TPOM(1,1);
else
Tdist=TPOM(2,3);
end
if (R==0)
TNED=(((((((ERX)*(K*TDP))+(((ETX+EDA)*(K*TDP))+Emp*(K*TDP)*Tdist*Tdist))))));
else
TNED=(((((((ERX)*(K*TDP))+(((ETX+EDA)*(K*TDP))+Emp*(K*TDP)*Tdist*Tdist*Tdist*Tdist))))));    
end
S(i).E=S(i).E-TNED;
%Total energy dispatched for current round
TTNED=TTNED+TNED;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (S(i).E<=0.4)
   TCSV= Ti + (Tf-Ti).*rand(1,1);
TNED=(((((((ERX)*(K))+(((ETX+EDA)*(K))+Emp*(K)*Tdist*Tdist))))));
S(i).E=S(i).E-TNED;
%Total energy dispatched for current round
TTNED=TTNED+TNED;
end    
end
    if (S(i).E<=0)
Talive=Talive-1;
end
end
%fprintf('Average Residual Eneergy')
Talive
ATNED=TTNED/100;
%Average Energy dispatched calculation 
TAED=TAED+ATNED
%Totla energy dispatched for each round
TRE=Eo-TAED
TTED=TTED+TTNED;
%TTD=TTD+(K*Talive);
if (TRE<=0.05)
    TRE=0;
Talive=0;
end
xtoc=toc
xtocT=[xtocT; xtoc];
aliveT=[aliveT; Talive];
ARET=[ARET; TRE];
%TEDT=[TEDT; TTED];
%TTDT=[TTDT; TTD];
%TAEDT=[TAEDT; TAED];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(1)
r
toc
end
xtoc=xtocT(:,1);
alive=aliveT(:,1);
ARE=ARET(:,1); 
%TED=TEDT(:,1);
%TDBS=TTDT(:,1);
%AED=TAEDT(:,1);
figure(22)
hold on
plot(xtoc,alive,'black','LineWidth',1);
ylabel('Numbers of Alive/ Nodes');
xlabel('Simulations Time in Seconds ');
figure(33)
hold on
plot(xtoc,ARE,'black','LineWidth',1);
ylabel('Average Residual Energy');
xlabel('Simulations Time in Seconds ');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       