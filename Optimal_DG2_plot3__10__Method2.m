%% Method 2: Finding based on f1+f2 and applying margins for Iqp_min<x<Iqp_max && Iqn_min<y<Iqn_max 

syms x1 y1 x2 y2

d=5*pi/12;


hold on
grid on

step=0.1;
xx=[0:step:1];
yy=[0:step:1];
[x1,y1]=meshgrid(xx,yy);
[x2,y2]=meshgrid(xx,yy);


%% DG1

f1 = x1 + y1 ;

for i=1:1/step+1
    for j=1:1/step+1
        
        Ip=.6;
        Ilim=1;
        
        g(1)= Ip^2 - Ilim^2 + x1(i,j)^2 + y1(i,j)^2 + Ip*y1(i,j)*(2*sin(d)) + x1(i,j)*y1(i,j)*(-2*cos(d)) ;
        g(2)= Ip^2 - Ilim^2 + x1(i,j)^2 + y1(i,j)^2 + Ip*y1(i,j)*(sqrt(3)*cos(d)-sin(d)) + x1(i,j)*y1(i,j)*(cos(d)+sqrt(3)*sin(d)) ;
        g(3)= Ip^2 - Ilim^2 + x1(i,j)^2 + y1(i,j)^2 + Ip*y1(i,j)*(-sqrt(3)*cos(d)-sin(d)) + x1(i,j)*y1(i,j)*(cos(d)-sqrt(3)*sin(d)) ;
        G=[g(1); g(2); g(3)];
        
        if any(G > 0.001)
            f1(i,j)=-1;
        end
                       
    end
end

subplot(3,2,1); 
surface(x1,y1,f1)
colorbar



%% DG2

f2 = x2 + y2 ;

for i=1:1/step+1
    for j=1:1/step+1
        
        Ip=.2;
        Ilim=1;
        
        g(1)= Ip^2 - Ilim^2 + x2(i,j)^2 + y2(i,j)^2 + Ip*y2(i,j)*(2*sin(d)) + x2(i,j)*y2(i,j)*(-2*cos(d)) ;
        g(2)= Ip^2 - Ilim^2 + x2(i,j)^2 + y2(i,j)^2 + Ip*y2(i,j)*(sqrt(3)*cos(d)-sin(d)) + x2(i,j)*y2(i,j)*(cos(d)+sqrt(3)*sin(d)) ;
        g(3)= Ip^2 - Ilim^2 + x2(i,j)^2 + y2(i,j)^2 + Ip*y2(i,j)*(-sqrt(3)*cos(d)-sin(d)) + x2(i,j)*y2(i,j)*(cos(d)-sqrt(3)*sin(d)) ;
        G=[g(1); g(2); g(3)];
        
        if any(G > 0.001)
            f2(i,j)=-1;
        end
        
    end
end

subplot(3,2,2); 
surface(x2,y2,f2)
colorbar

%% VS Limits

% % for i=1:1/step+1
% %     for j=1:1/step+1
% %         
% %         
% %         G=[g(1); g(2); g(3)];
% %         
% %         if any(G > 0.001)
% %             f2(i,j)=-1;
% %         end
% %         
% %     end
% % end

subplot(3,2,[3:6]);
surface(x1+x2,y1+y2,f1+f2)
colorbar

[jm1,im1]=find(abs(f1-max(max(f1)))<0.01);
[im1-1,jm1-1]*step
[jm2,im2]=find(abs(f2-max(max(f2)))<0.01);
[im2-1,jm2-1]*step



