function [thrshld]=get_p_thrshld_xx4(p_curve,wm,max_x,bl_x,x,old_x)

%get_bounce function
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%This function calculates the threshold for function P:
% - p_curve: the P-curve (indexed 10*c)
% - wm: working model object
% - max_x: the oscillation in x occurs between 0 and max_x
% - bl_x:  the oscillation in x occurs around bl_x (baseline x)
% - old_x: last x position
%The function returns:
% - thrshld: the threshold for P

global PRMS_ACLAB

% -----------------------------------------------
delta_bl = x - bl_x; % x - baseline
% -----------------------------------------------
% -----------------------------------------------
delta_old = x - old_x; % x - old_x
% -----------------------------------------------

if delta_old < 0
    to_zero = true;
else
    to_zero = false;
end

%if d_ext < d_int
%    d_ext = d_int;
%end

% -----------------------------------------------
old_delta_bl = old_x - bl_x; % old_x - baseline
% -----------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rnd_1 = rand;
k = PRMS_ACLAB.drop_effect_th_xx4;

if PRMS_ACLAB.drop_effect_th
    %k = 0.06;
    if to_zero
        thrshld = PRMS_ACLAB.thrshld - k - rnd_1*k; %drop compensation
    else
        thrshld = PRMS_ACLAB.thrshld + k + rnd_1*k;
    end
else
    %k = 0.06;
    %k = 0.08;%ok
    thrshld = PRMS_ACLAB.thrshld + k + rnd_1*k;
end
