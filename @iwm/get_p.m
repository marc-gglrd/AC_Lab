function [P]=get_p(wm,p_curve_ndx,x)

%get_p function
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%Considering the probability function: P = x / (x + c^x),
%this function returns P
%given the curve index p_curve_ndx
%identified by its parameter c:
% - p_curve_ndx = 1 corresponds to c = 0.1
% ...
% - p_curve_ndx = 9 corresponds to c = 0.9

% --- REFERENCE P-CURVE: p_curve_ndx ------------
p_curve_c = double(p_curve_ndx);
p_curve_c = p_curve_c/10;
% -----------------------------------------------

% --- Probability -------------------------------
P = x / (x + p_curve_c^x);
% -----------------------------------------------










