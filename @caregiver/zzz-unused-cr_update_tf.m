function [agt]=cr_update_tf(agt,agt2)

%update_tf function for class CAREGIVER
%agt:  caregiver object
%agt2: child     object
%updates target and fixed values in agt caregiver
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

%%% -----------------------------------------------------------------
%%% --- UPDATE TARGET & FIX VALUES ----------------------------------
%%% -----------------------------------------------------------------

%%% --- IF IMPRINTING OCCURS
%%% --- ONLY CHILD VALUES CAN CHANGE

% --- CAREGIVER TARGET E-DISTANCE/INDIFFERENCE --
%e-distance:           cf2_ed = i + i_fix --> i_fix = cf2_ed_trgt - cf2_i_trgt
%target e-distance:    cf2_ed_trgt = 100*   (agt.cf2_in)
%target indifference:  cf2_i_trgt  = k*maxi*(agt.cf2_in)

%p-distance:           cf3_pd = d + d_fix --> i_fix = cf3_pd_trgt - cf3_d_trgt
%target p-distance:    cf3_pd_trgt = 100*   (1-agt.cf3_un)
%target lab distance:  cf3_d_trgt  = k*size*(1-agt.cf3_un)

%vulnerability:        cf4_vu = d + d_fix --> i_fix = cf4_vu_trgt - cf4_d_trgt
%target vulnerability: cf4_vu_trgt = 100*   (1-agt.cf4_li)
%target lab distance:  cf4_d_trgt  = k*size*(1-agt.cf4_li)

cf2_ed_trgt = agt.cf2_ed_trgt; %NO CHANGE      
cf3_pd_trgt = agt.cf3_pd_trgt; %NO CHANGE 
cf4_vu_trgt = agt.cf4_vu_trgt; %NO CHANGE  
cf2_i_trgt  = agt.cf2_i_trgt;  %NO CHANGE         
cf3_d_trgt  = agt.cf3_d_trgt;  %NO CHANGE   
cf4_d_trgt  = agt.cf4_d_trgt;  %NO CHANGE   
cf2_if      = agt.cf2_if;      %NO CHANGE         
cf3_df      = agt.cf3_df;      %NO CHANGE  
cf4_df      = agt.cf4_df;      %NO CHANGE  

% --- CAREGIVER X-Fixes -------------------------
%x = ((no_cf2_cntr * lab_lns) + ((1-p2n_cf2) * (cf2_ed/100))) * (1-cf2_in) + x_fix
%x = ((no_cf3_cntr * lab_dgr) + ((1-p2n_cf3) * (cf3_pd/100))) * (1-cf3_un) + x_fix
%x = ((no_cf4_cntr * lab_dgr) + ((1-p2n_cf4) * (cf4_vu/100))) * (1-cf4_li) + x_fix

p2give_cf2_xf = agt.p2give_cf2_xf; %NO CHANGE      
p2give_cf3_xf = agt.p2give_cf3_xf; %NO CHANGE
p2give_cf4_xf = agt.p2give_cf4_xf; %NO CHANGE

% -------------------------------------

agt.cf2_ed_trgt   = cf2_ed_trgt;
agt.cf3_pd_trgt   = cf3_pd_trgt;
agt.cf4_pd_trgt   = cf4_vu_trgt;

agt.cf2_i_trgt    = cf2_i_trgt;
agt.cf3_d_trgt    = cf3_d_trgt;
agt.cf4_d_trgt    = cf4_d_trgt;

agt.cf2_if        = cf2_if;
agt.cf3_df        = cf3_df;
agt.cf4_df        = cf4_df;

agt.p2give_cf2_xf = p2give_cf2_xf;
agt.p2give_cf3_xf = p2give_cf3_xf;
agt.p2give_cf4_xf = p2give_cf4_xf;

