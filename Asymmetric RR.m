
clear; close all; clc;

% parameters
M1 = 2.2;
gamma = 1.4;
shift_plus_deg  = 6;   % top deflection
shift_minus_deg = 10;   % bottom deflection
N = 50;
epsv = 1e-8;

% --- base polar (M1) ---
beta = linspace(asin(1/M1), pi/2, N);
Mn1 = M1 .* sin(beta);
tan_theta = 2 .* cot(beta) .* (Mn1.^2 - 1) ./ (M1.^2 .* (gamma + cos(2.*beta)) + 2);
theta1_pos = atan(tan_theta) * 180/pi;         % positive branch (deg)
P2P1_pos = 1 + (2*gamma/(gamma+1)) .* (Mn1.^2 - 1);

theta_base = [-fliplr(theta1_pos), theta1_pos];
Pbase = [fliplr(P2P1_pos), P2P1_pos];

% --- compute top deflection (+shift) ---
[~, idx_plus] = min(abs(theta1_pos - shift_plus_deg));
beta_shock_plus = beta(idx_plus);
Mn1_s_plus = M1 * sin(beta_shock_plus);
P2P1_plus = 1 + (2*gamma/(gamma+1))*(Mn1_s_plus^2 - 1);

Mn2_after_plus = sqrt((1 + (gamma-1)/2 * Mn1_s_plus^2) / (gamma*Mn1_s_plus^2 - (gamma-1)/2));
M2_plus = Mn2_after_plus / sin(beta_shock_plus - deg2rad(shift_plus_deg));

beta2_plus = linspace(asin(1/M2_plus)+epsv, pi/2-epsv, N);
Mn2_plus = M2_plus .* sin(beta2_plus);
tan_theta2_plus = 2 .* cot(beta2_plus) .* (Mn2_plus.^2 - 1) ./ (M2_plus.^2 .* (gamma + cos(2.*beta2_plus)) + 2);
theta2_pos_plus = atan(tan_theta2_plus) * 180/pi;
P3P2_plus = 1 + (2*gamma/(gamma+1)) .* (Mn2_plus.^2 - 1);

theta_plus_full = [-fliplr(theta2_pos_plus), theta2_pos_plus] + shift_plus_deg;
P_plus_full = [fliplr(P3P2_plus), P3P2_plus] * P2P1_plus;

% --- compute bottom deflection (-shift) ---
[~, idx_minus] = min(abs(theta1_pos - shift_minus_deg));
beta_shock_minus = beta(idx_minus);
Mn1_s_minus = M1 * sin(beta_shock_minus);
P2P1_minus = 1 + (2*gamma/(gamma+1))*(Mn1_s_minus^2 - 1);

Mn2_after_minus = sqrt((1 + (gamma-1)/2 * Mn1_s_minus^2) / (gamma*Mn1_s_minus^2 - (gamma-1)/2));
M2_minus = Mn2_after_minus / sin(beta_shock_minus - deg2rad(shift_minus_deg));

beta2_minus = linspace(asin(1/M2_minus)+epsv, pi/2-epsv, N);
Mn2_minus = M2_minus .* sin(beta2_minus);
tan_theta2_minus = 2 .* cot(beta2_minus) .* (Mn2_minus.^2 - 1) ./ (M2_minus.^2 .* (gamma + cos(2.*beta2_minus)) + 2);
theta2_pos_minus = atan(tan_theta2_minus) * 180/pi;
P3P2_minus = 1 + (2*gamma/(gamma+1)) .* (Mn2_minus.^2 - 1);

theta_minus_full = [-fliplr(theta2_pos_minus), theta2_pos_minus] - shift_minus_deg;
P_minus_full = [fliplr(P3P2_minus), P3P2_minus] * P2P1_minus;

% --- plot ---
figure('Units','normalized','Position',[0.12 0.12 0.6 0.6]); hold on; box on; grid on;
plot(theta_base, Pbase, 'r-', 'LineWidth', 2);        
plot(theta_plus_full,  P_plus_full, 'g-', 'LineWidth', 2);       
plot(theta_minus_full, P_minus_full, 'b-', 'LineWidth', 2);      
xlabel('\theta (deg)');
ylabel('P / P_1');
title(sprintf('Shock polars: M1=%.2f, top shift=%.g^\\circ, bottom shift=%.g^\\circ', M1, shift_plus_deg, shift_minus_deg));
%xlim([-10 10]);
%ylim([1 max([P_plus_full P_minus_full])*1.05]);
set(gcf,'color','w');
legend('Base polar (P_2/P_1)','Top deflection (P_3/P_1)','Bottom deflection (P_3/P_1)','Location','northwest');
