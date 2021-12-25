function [cst] = p_consts(wm)

%p_consts function
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%Returns threshold and median values for probability function
%Probability function: P = x / (x + c^x)
%c is current value of attachment-dimension (ad) or caregiving-features (cf)
%c can be: 0.1, 0.2,...,0.9

%for P = 0.50, x is:
cst.p_050_crv_1 = 0.3990; %x for c = 0.1 (p-curve 1)
cst.p_050_crv_2 = 0.4696; %x for c = 0.2 (p-curve 2)
cst.p_050_crv_3 = 0.5290; %x for c = 0.3 (p-curve 3)
cst.p_050_crv_4 = 0.5850; %x for c = 0.4 (p-curve 4)
cst.p_050_crv_5 = 0.6412; %x for c = 0.5 (p-curve 5)
cst.p_050_crv_6 = 0.6995; %x for c = 0.6 (p-curve 6)
cst.p_050_crv_7 = 0.7620; %x for c = 0.7 (p-curve 7)
cst.p_050_crv_8 = 0.8308; %x for c = 0.8 (p-curve 8)
cst.p_050_crv_9 = 0.9087; %x for c = 0.9 (p-curve 9)

%for P = 0.75, x is:
cst.p_075_crv_1 = 0.6585; %x for c = 0.1 (p-curve 1)
cst.p_075_crv_2 = 0.8120; %x for c = 0.2 (p-curve 2)
cst.p_075_crv_3 = 0.9527; %x for c = 0.3 (p-curve 3)
cst.p_075_crv_4 = 1.0975; %x for c = 0.4 (p-curve 4)
cst.p_075_crv_5 = 1.2561; %x for c = 0.5 (p-curve 5)
cst.p_075_crv_6 = 1.4387; %x for c = 0.6 (p-curve 6)
cst.p_075_crv_7 = 1.6597; %x for c = 0.7 (p-curve 7)
cst.p_075_crv_8 = 1.9441; %x for c = 0.8 (p-curve 8)
cst.p_075_crv_9 = 2.3436; %x for c = 0.9 (p-curve 9)

%for P = c, x is:
cst.p_c_crv_1 = 0.09026; %x for c = 0.1 (p-curve 1)
cst.p_c_crv_2 = 0.18548; %x for c = 0.2 (p-curve 2)
cst.p_c_crv_3 = 0.29901; %x for c = 0.3 (p-curve 3)
cst.p_c_crv_4 = 0.44390; %x for c = 0.4 (p-curve 4)
cst.p_c_crv_5 = 0.64120; %x for c = 0.5 (p-curve 5)
cst.p_c_crv_6 = 0.93190; %x for c = 0.6 (p-curve 6)
cst.p_c_crv_7 = 1.41070; %x for c = 0.7 (p-curve 7)
cst.p_c_crv_8 = 2.36160; %x for c = 0.8 (p-curve 8)
cst.p_c_crv_9 = 5.20200; %x for c = 0.9 (p-curve 9)

%median x:
cst.p_mdx_1 = cst.p_050_crv_1; %median x for c = 0.1
cst.p_mdx_2 = cst.p_050_crv_2; %median x for c = 0.2
cst.p_mdx_3 = cst.p_050_crv_3; %median x for c = 0.3
cst.p_mdx_4 = cst.p_050_crv_4; %median x for c = 0.4
cst.p_mdx_5 = cst.p_050_crv_5; %median x for c = 0.5
cst.p_mdx_6 = cst.p_050_crv_6; %median x for c = 0.6
cst.p_mdx_7 = cst.p_050_crv_7; %median x for c = 0.7
cst.p_mdx_8 = cst.p_050_crv_8; %median x for c = 0.8 
cst.p_mdx_9 = cst.p_050_crv_9; %median x for c = 0.9

%threshold x (x will be anchored to this value):
cst.p_thx_1 = cst.p_075_crv_1; %threshold x for c = 0.1
cst.p_thx_2 = cst.p_075_crv_2; %threshold x for c = 0.2
cst.p_thx_3 = cst.p_075_crv_3; %threshold x for c = 0.3
cst.p_thx_4 = cst.p_075_crv_4; %threshold x for c = 0.4
cst.p_thx_5 = cst.p_075_crv_5; %threshold x for c = 0.5
cst.p_thx_6 = cst.p_075_crv_6; %threshold x for c = 0.6
cst.p_thx_7 = cst.p_075_crv_7; %threshold x for c = 0.7
cst.p_thx_8 = cst.p_075_crv_8; %threshold x for c = 0.8 
cst.p_thx_9 = cst.p_075_crv_9; %threshold x for c = 0.9

end

