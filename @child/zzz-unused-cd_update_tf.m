function [agt]=cd_update_tf(agt,agt2)

%update_tf function for class CHILD
%agt:  child     object
%agt2: caregiver object
%updates target and fixed values in agt child
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB PRMS_C_CD 

%%% -----------------------------------------------------------------
%%% --- UPDATE TARGET & FIX VALUES ----------------------------------
%%% -----------------------------------------------------------------

%%% --- IF IMPRINTING OCCURS
%%% --- ONLY CHILD VALUES CAN CHANGE
%%% --- (PRMS_ACLAB & PRMS_C_CD MUST HAVE BEEN CHANGED BEFORE)

% --- CHILD TARGET E-DISTANCE/INDIFFERENCE ------
%e-distance:           cf2_ed = i + i_fix --> i_fix = cf2_ed_trgt - cf2_i_trgt
%target e-distance:    cf2_ed_trgt = 100*   (agt.ad2_av)
%target indifference:  cf2_i_trgt  = k*maxi*(agt.ad2_av)

%p-distance:           cf3_pd = d + d_fix --> d_fix = cf3_pd_trgt - cf3_d_trgt
%target p-distance:    cf3_pd_trgt = 100*   (1-agt.ad3_am)
%target lab distance:  cf3_d_trgt  = k*size*(1-agt.ad3_am)

%vulnerability:        cf4_vu = d + d_fix --> d_fix = cf4_vu_trgt - cf4_d_trgt
%target vulnerability: cf4_vu_trgt = 100*   (1-agt.ad4_ph)
%target lab distance:  cf4_d_trgt  = k*size*(1-agt.ad4_ph)

cf2_ed_trgt = 100*(  PRMS_ACLAB.ad2_av);        
cf3_pd_trgt = 100*(1-PRMS_ACLAB.ad3_am); 
cf4_vu_trgt = 100*(1-PRMS_ACLAB.ad4_ph); 

cf2_i_trgt  = PRMS_ACLAB.i_trgt_ad2_k*PRMS_ACLAB.maxi*(  PRMS_ACLAB.ad2_av);        
cf3_d_trgt  = PRMS_ACLAB.d_trgt_ad3_k*PRMS_ACLAB.size*(1-PRMS_ACLAB.ad3_am);  
cf4_d_trgt  = PRMS_ACLAB.d_trgt_ad4_k*PRMS_ACLAB.size*(1-PRMS_ACLAB.ad4_ph);  

cf2_if      = cf2_ed_trgt - cf2_i_trgt;         
cf3_df      = cf3_pd_trgt - cf3_d_trgt;
cf4_df      = cf4_vu_trgt - cf4_d_trgt;

% --- CHILD X-Fixes -----------------------------
%x = ((no_cf2_cntr * lab_lns) + ((1-p2g_cf2) * (cf2_ed/100))) * (1-ad2_av) + x_fix
%x = ((no_cf3_cntr * lab_dgr) + (  (p2g_cf3) * (cf3_pd/100))) *   (ad3_am) + x_fix
%x = ((no_cf4_cntr * lab_dgr) + (  (p2g_cf4) * (cf4_vu/100))) *   (ad4_ph) + x_fix

p2need_cf2_xf = PRMS_C_CD.p2need_cf2_xf;      
p2need_cf3_xf = PRMS_C_CD.p2need_cf3_xf;
p2need_cf4_xf = PRMS_C_CD.p2need_cf4_xf;

% -------------------------------------

agt.cf2_ed_trgt   = cf2_ed_trgt;
agt.cf3_pd_trgt   = cf3_pd_trgt;
agt.cf4_pd_trgt   = cf4_pd_trgt;

agt.cf2_i_trgt    = cf2_i_trgt;
agt.cf3_d_trgt    = cf3_d_trgt;
agt.cf4_d_trgt    = cf4_d_trgt;

agt.cf2_if        = cf2_if;
agt.cf3_df        = cf3_df;
agt.cf4_df        = cf4_df;

agt.p2need_cf2_xf = p2need_cf2_xf;
agt.p2need_cf3_xf = p2need_cf3_xf;
agt.p2need_cf4_xf = p2need_cf4_xf;

