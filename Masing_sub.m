function [terminal,num] = Masing_sub(re,num,eps_am,shape)
%This function plots hesteretic loops according to the optimized
%Masing criteria proposed by Robert Pyke

%   Detailed explanation goes here
%   -Using strain-controlled technique
%   -Hysteretic loops are presented in a normalized stress-strain plane

%   Inputs in order
%   -re : stress reversal point
%   -ur : +1 for reloading but -1 for unloading
%   -eps_am : specifying the strain amplitude
%   -shape : parameters controlling shape of the stress-strain curve

%   Outputs in order
%   -terminal : end point of one single loading event

gam_y=shape(1);
tau_max=shape(2);
Gmax=tau_max/gam_y;
gam_c=re(1);
tauc=re(2);

ur=(-1)^(num+1);
n=abs(ur*1-tauc/tau_max);

%uncomment the following '' if loop '' for implementing 
%the second-order Masing criteria
% if num==1
%     n=1;
% else
%     n=2;
% end

gam=linspace(gam_c,gam_y*eps_am,50);
tau=tauc+(gam-gam_c).*(1./(1/Gmax+abs(gam-gam_c)/n/gam_y/Gmax));
comet(gam/gam_y,tau/tau_max);%,'-','linewidth',1)

terminal=[gam(end),tau(end)];
num=num+1;

end

