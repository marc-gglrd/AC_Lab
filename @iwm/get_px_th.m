function [th_x]=get_px_th(wm,p_curve)

%get_bounce function
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%Considering the probability function: P = x / (x + c^x),
%this function returns the x values:
% - th_x: corresponding to probability 0.75
%given the curve of index p_curve
%identified by its parameter c:
% - p_curve_ndx = 1 corresponds to c = 0.1
% ...
% - p_curve_ndx = 9 corresponds to c = 0.9

cst = p_consts(wm);

p_curve = int8(p_curve);

if p_curve == 1
    th_x = cst.p_thx_1;
elseif p_curve == 2
    th_x = cst.p_thx_2;
elseif p_curve == 3
    th_x = cst.p_thx_3;
elseif p_curve == 4
    th_x = cst.p_thx_4;
elseif p_curve == 5
    th_x = cst.p_thx_5;
elseif p_curve == 6
    th_x = cst.p_thx_6;
elseif p_curve == 7
    th_x = cst.p_thx_7;
elseif p_curve == 8
    th_x = cst.p_thx_8;
elseif p_curve == 9
    th_x = cst.p_thx_9;
end





