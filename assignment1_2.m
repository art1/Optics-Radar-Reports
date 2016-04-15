% assignment 2 of Problem 1

dt=0.01; %Sampling interval 0.01 s 
t=0:dt:1000*dt;
f=10;
xs=cos(2*pi*f*t);

dt1=0.01; %Sampling interval 0.01 s 
t1=0:dt1:2000*dt;
f=10;
xs1=cos(2*pi*f*t1);

dt2=99*dt; %Sampling interval 0.99 s 
t2=0:dt2:2000*dt;
xs2=cos(2*pi*f*t2);

dt3=199*dt; %Sampling interval 1.99 s 
t3=0:dt3:2000*dt;
xs3=cos(2*pi*f*t3);

close all
plot(t1,xs1);
hold on
plot(t2,xs2,'r');
plot(t3,xs3,'k');

legend('dt=0.01s','dt=0.99s', 'dt=1.99s')
xlabel('t [s]')
ylabel('x(t)')
title('Aliasing')
set(gcf,'Color','w')