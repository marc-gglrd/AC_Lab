function [md_x]=get_px_md(wm,p_curve)

%get_bounce function
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%Considering the probability function: P = x / (x + c^x),
%this function returns the x values:
% - md_x: corresponding to probability 0.5
%given the curve of index p_curve
%identified by its parameter c:
% - p_curve_ndx = 1 corresponds to c = 0.1
% ...
% - p_curve_ndx = 9 corresponds to c = 0.9

cst = p_consts(wm);

p_curve = int8(p_curve);

if p_curve == 1
    md_x = cst.p_mdx_1;
elseif p_curve == 2
    md_x = cst.p_mdx_2;
elseif p_curve == 3
    md_x = cst.p_mdx_3;
elseif p_curve == 4
    md_x = cst.p_mdx_4;
elseif p_curve == 5
    md_x = cst.p_mdx_5;
elseif p_curve == 6
    md_x = cst.p_mdx_6;
elseif p_curve == 7
    md_x = cst.p_mdx_7;
elseif p_curve == 8
    md_x = cst.p_mdx_8;
elseif p_curve == 9
    md_x = cst.p_mdx_9;
end





