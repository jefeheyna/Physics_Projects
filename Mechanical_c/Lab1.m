%Created by: Jeffrey Hejna
%Date: 2/13/16
%Lab 1: Mechanical c


omega = [-750,-1500,750,1500];
s = [0.008300, 0.008150, 0.008610, 0.008760] - 0.00847;
A = 0.268;
B = 0.474;
D = 9.83;
p = polyfit(omega,s,1);
x = [-0.2 * 10.^4, 0.2 * 10.^4];
y = polyval(p,x);
omega_error=[50,50,50,50];
s_error=[0.000005,0.000005,0.000005,0.000005];

A_e=0.0007;
D_e=0.05;
B_e=0.004;

m_e=0.1e-07;
m=p(1);

e_1 = ((D.^2)*A_e/(m*(B+D))).^2;
e_2 = ((A*(D.^2)*B_e)/(m*((B+D).^2))).^2;
e_3 = ((((-A)*(D.^2)/(m*(B+D).^2)) + ((2*A*D)/(m*(B+D))))*D_e).^2;
e_4 = ((A*(D.^2)*m_e)/((m.^2)*(B+D))).^2;
c_e = 8*pi*sqrt(e_1 + e_2 +e_3 +e_4);
display(c_e);

slope = p(1);
%display(slope);
c = 1/slope * (8*pi*A*D.^2)/(D + B);
display(c);
close all;

figure
hold on;
plot(x,y);

errorbar(omega,s,s_error,'o');
herrorbar(omega,s,omega_error,'o');

xlabel ('Rotational speed of mirror (rev/s)');
ylabel ('Displacement of point image (m)');

hold off;



