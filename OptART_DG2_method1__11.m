%% Method 1: finding Iqp_total vs Iqn_total curve

clear all
close all
syms x1 y1 x2 y2

step=0.2;
xx=[0:step:1];
d=5*pi/12;


%% it seems that it's working :?

%% DG1
ym1=zeros(1,1/step+1);
for i=1:1/step+1
        Ip=.6;
        Ilim=1;
        g(1) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(2*sin(d)) + xx(i)*y1*(-2*cos(d)) , y1 ) );
        g(2) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(sqrt(3)*cos(d)-sin(d)) + xx(i)*y1*(cos(d)+sqrt(3)*sin(d)) , y1) );
        g(3) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(-sqrt(3)*cos(d)-sin(d)) + xx(i)*y1*(cos(d)-sqrt(3)*sin(d)) , y1) );
        ym1(i) = min( min(g(1) , g(2)) , g(3) ) ;
        if ym1(i) < 0
           ym1(i)=0;
        end
end
grid on
subplot(3,2,1); 
plot(xx,ym1)
hold on 

%% DG2
ym2=zeros(1,1/step+1);
for i=1:1/step+1
        Ip=.2;
        Ilim=1;
        g(1) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(2*sin(d)) + xx(i)*y1*(-2*cos(d)) , y1 ) );
        g(2) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(sqrt(3)*cos(d)-sin(d)) + xx(i)*y1*(cos(d)+sqrt(3)*sin(d)) , y1) );
        g(3) = max( solve( Ip^2 - Ilim^2 + xx(i)^2 + y1^2 + Ip*y1*(-sqrt(3)*cos(d)-sin(d)) + xx(i)*y1*(cos(d)-sqrt(3)*sin(d)) , y1) );
        ym2(i) = min( min(g(1) , g(2)) , g(3) ) ;
        if ym2(i) < 0
           ym2(i)=0;
        end
end
subplot(3,2,1); 
plot(xx,ym2)

ym12=zeros(1/step+1,2);
%% convelute
% for i=1:1/step+1
%     for j=1:1/step+1
%         ym12(i*j,2)=ym1(i)+ym2(j);
%     end
%         if any ym12(6*i+j-6,1)=(i+j-2)*step;
%     end
%     end


    %% Hello git
    %% How are you github?? :)

