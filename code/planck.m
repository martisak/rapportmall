function p = planck(T)
! Plancks strålningslag
! Kvantfysik F3
! Anders Berg, Martin Isaksson

% Konstanter
h = 6.6261*10^-34; % Plancks konstant (Js)
c = 2.99792458*10^8; % Ljushastigheten (m/s)
k = 1.380657*10^-23; % Boltzmanns konstant (J/K)

% Våglängder
lambda = linspace(1e-10,10e-5,200); % (m)

% Har användaren angivit något?
if (nargin==0)
%Temperaturer (K)
T = [200, 250, 300];
end

B=(2.*h.*c^2)./lambda.^5;

% Rensa figur, rita ut flera m.m.
clf
hold on
maxint = 0;

% Rita ut kurvorna.
for (i=1:length(T))
     A=(h.*c)./(k.*T(i).*lambda);
     B1=B.*(1./(exp(A)-1));
     plot(lambda,B1,'r');
     maxint = max(maxint,max(B1));
     text(lambda(find(B1==max(B1))),max(B1)+5e5,strcat('T = ',num2str(T(i))));
end

% Fixa axlar m.m.
title('Plancks strålningslag')
xlabel('Våglängd, \lambda (m)');
ylabel('B_\lambda(T)')
axis([min(lambda) max(lambda) 0 maxint*1.2])
