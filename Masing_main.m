clc;clear;
figure;
hold on;box on;grid on;

%% basic shape parameter
gam_y=0.2;
tau_max=100;
Gmax=tau_max/gam_y;
shape=[gam_y,tau_max,Gmax];

%% skeleton curves
scatter(0,0,'ro')
gam=linspace(0,gam_y*20,50);
tau=gam./(1/Gmax+gam/gam_y/Gmax);
plot(gam/gam_y,tau/tau_max,'r--','linewidth',1)

gam=linspace(0,-gam_y*20,50);
tau=gam./(1/Gmax-gam/gam_y/Gmax);
plot(gam/gam_y,tau/tau_max,'r--','linewidth',1)

%% loading scheme, which can be customized by users
loading=[1,0.5,3,2.5,5,4.5,7,6.5,9,8.5,15];
loading=[loading,10,10.5,5,5.5,0,0.5,-5,-4.5,-10,-9.5,-15,-10];
loading=[loading,-10.5,-5,-5.5,0,-0.5,5,4.5,10,9.5,15];
loading=[loading,-10,10,-5,5,-3,3,-2,2,-1,1];
loading=[loading,-2,2,-3,3,-5,5,-10,10];
loading=[loading,-5,5,-3,3,-2,2,-1,1];

%%
% virgin loading
[terminal,num] = Masing_sub([0,0],1,loading(1),shape);
% cyclic loading
for n=2:length(loading)
    [terminal,num] = Masing_sub(terminal,num,loading(n),shape);
end
