function [agt,cf2_ed,cf3_pd,cf4_vu]=cd_update_ed_pd_vu(agt)

%update function for class CHILD
%agt: caregiver object
%updates emotional distance, physical distance, and vulnerability 
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB PRMS_C_CD

cf2_ed = agt.cf2_ed;
cf3_pd = agt.cf3_pd;
cf4_vu = agt.cf4_vu;

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++ UPDATE ED +++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if PRMS_ACLAB.cf2_on
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% -----------------------------------------------
i     = agt.cf2_i;  %child indifference to caregiver
i_fix = agt.cf2_if; %adjustment to e-distance
% -----------------------------------------------

cf2_ed_old = agt.cf2_ed;

rdm = rand;%CHILD CF2 AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
ed_trgt = PRMS_C_CD.cf2_ed_trgt;%agt.cf2_ed_trgt;
i_trgt  = PRMS_C_CD.cf2_i_trgt;%ed_trgt - i_fix;
cf2_ed_new = cf2_ed_old + (2 * rdm * ((i - i_trgt)-(cf2_ed_old - ed_trgt)));

agt.cf2_ed = cf2_ed_new;
cf2_ed     = agt.cf2_ed;

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++ UPDATE PD +++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if PRMS_ACLAB.cf3_on
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% -----------------------------------------------
d     = agt.cf3_d;  %child distancing to caregiver
d_fix = agt.cf3_df; %adjustment to p-distance
% -----------------------------------------------

cf3_pd_old = agt.cf3_pd;

rdm = rand;%CHILD CF3 AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
pd_trgt = PRMS_C_CD.cf3_pd_trgt;%agt.cf3_pd_trgt;
d_trgt  = PRMS_C_CD.cf3_d_trgt;%pd_trgt - d_fix;
cf3_pd_new = cf3_pd_old + (2 * rdm * ((d - d_trgt)-(cf3_pd_old - pd_trgt)));

agt.cf3_pd = cf3_pd_new;
cf3_pd     = agt.cf3_pd;

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++ UPDATE VU +++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if PRMS_ACLAB.cf4_on
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% -----------------------------------------------
d     = agt.cf4_d;  %child distancing to caregiver
d_fix = agt.cf4_df; %adjustment to vulnerability
% -----------------------------------------------

cf4_vu_old = agt.cf4_vu;

rdm = rand;%CHILD CF4 AAAAAAAAAAAAAAAAAAAAAAAAAAAAA
vu_trgt = PRMS_C_CD.cf4_vu_trgt;%agt.cf4_vu_trgt;
d_trgt  = PRMS_C_CD.cf4_d_trgt;%vu_trgt - d_fix;
cf4_vu_new = cf4_vu_old + (2 * rdm * ((d - d_trgt)-(cf4_vu_old - vu_trgt)));

agt.cf4_vu = cf4_vu_new;
cf4_vu     = agt.cf4_vu;

%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end
%%% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



