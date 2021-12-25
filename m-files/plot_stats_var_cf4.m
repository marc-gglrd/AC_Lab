%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf4 plot_stats variables ------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global N_IT IT_STATS 

p2need_cf4_x  = IT_STATS.p2need_cf4_x;  %(7)
p2give_cf4_x  = IT_STATS.p2give_cf4_x;  %(9)
p2need_cf4_xf = IT_STATS.p2need_cf4_xf; %(11)
p2give_cf4_xf = IT_STATS.p2give_cf4_xf; %(13)
p2need_cf4    = IT_STATS.p2need_cf4;    %(15)
p2give_cf4    = IT_STATS.p2give_cf4;    %(17)

ad4_ph        = IT_STATS.ad4_ph;        %(19)

cf4_li        = IT_STATS.cf4_li;        %(21)
   
% --- relevant events ---------------------------
    
need4_cf4     = IT_STATS.need4_cf4;     %(24)
need2give_cf4 = IT_STATS.need2give_cf4; %(26)

n4_n2g_cf4    = IT_STATS.n4_n2g_cf4;    %(28)
n2g_n4_cf4    = IT_STATS.n2g_n4_cf4;    %(30)
n4_n2g_st_cf4 = IT_STATS.n4_n2g_st_cf4; %(32)
    
n4_nn2g_cf4   = IT_STATS.n4_nn2g_cf4;   %(34)
n2g_nn4_cf4   = IT_STATS.n2g_nn4_cf4;   %(36)
    
% --- relevant event counters -------------------
    
need4_cf4_cntr     = IT_STATS.need4_cf4_cntr;     %(38) 
need2give_cf4_cntr = IT_STATS.need2give_cf4_cntr; %(40) 
    
n4_n2g_cf4_cntr    = IT_STATS.n4_n2g_cf4_cntr;    %(42)
n2g_n4_cf4_cntr    = IT_STATS.n2g_n4_cf4_cntr;    %(44)
n4_n2g_st_cf4_cntr = IT_STATS.n4_n2g_st_cf4_cntr; %(46)
      
n4_nn2g_cf4_cntr  = IT_STATS.n4_nn2g_cf4_cntr;    %(48)
n2g_nn4_cf4_cntr  = IT_STATS.n2g_nn4_cf4_cntr;    %(50)

% ---------------------------

no_cf4_cntr       = IT_STATS.no_cf4_cntr;         %(52)

% ---------------------------
no_cf4_ntrs       = IT_STATS.no_cf4_ntrs(N_IT+1); %(54) 
% ---------------------------
no_cf4_ls         = IT_STATS.no_cf4_ls(N_IT+1);   %(56)
% ---------------------------
  
no_cf4_m          = IT_STATS.no_cf4_m;            %(58)
no_cf4_dm2s       = IT_STATS.no_cf4_dm2s;         %(60)
no_cf4_sd         = IT_STATS.no_cf4_sd;           %(62)

 % ---- vulnerability ---------------------------

cf4_vu_cd      = IT_STATS.cf4_vu_cd;      %(68)
 
cf4_vu_cr      = IT_STATS.cf4_vu_cr;      %(70)

cf4_vu_cd_s    = IT_STATS.cf4_vu_cd_s;    %(72)
 
cf4_vu_cr_s    = IT_STATS.cf4_vu_cr_s;    %(74)
 
cf4_vu_cd_m    = IT_STATS.cf4_vu_cd_m;    %(76)
 
cf4_vu_cr_m    = IT_STATS.cf4_vu_cr_m;    %(78)

cf4_vu_cd_dm2s = IT_STATS.cf4_vu_cd_dm2s; %(80)
 
cf4_vu_cr_dm2s = IT_STATS.cf4_vu_cr_dm2s; %(82)
 
cf4_vu_cd_sd   = IT_STATS.cf4_vu_cd_sd;   %(84)
 
cf4_vu_cr_sd   = IT_STATS.cf4_vu_cr_sd;   %(86)

 % ---- target vulnerability --------------------
 
cf4_vu_trgt_cd = IT_STATS.cf4_vu_trgt_cd; %(88)
 
cf4_vu_trgt_cr = IT_STATS.cf4_vu_trgt_cr; %(90)

 % ---- distancing ------------------------------
 
cf4_d_cd      = IT_STATS.cf4_d_cd;      %(92)
 
cf4_d_cr      = IT_STATS.cf4_d_cr;      %(94)
 
cf4_d_cd_s    = IT_STATS.cf4_d_cd_s;    %(96)
 
cf4_d_cr_s    = IT_STATS.cf4_d_cr_s;    %(98)
 
cf4_d_cd_m    = IT_STATS.cf4_d_cd_m;    %(100)
 
cf4_d_cr_m    = IT_STATS.cf4_d_cr_m;    %(102)
 
cf4_d_cd_dm2s = IT_STATS.cf4_d_cd_dm2s; %(104)
 
cf4_d_cr_dm2s = IT_STATS.cf4_d_cr_dm2s; %(106)
 
cf4_d_cd_sd   = IT_STATS.cf4_d_cd_sd;   %(108)
 
cf4_d_cr_sd   = IT_STATS.cf4_d_cr_sd;   %(110)
 
 % ---- target distancing -----------------------
 
cf4_d_trgt_cd = IT_STATS.cf4_d_trgt_cd; %(112)
 
cf4_d_trgt_cr = IT_STATS.cf4_d_trgt_cr; %(114)
 
 % ---- distancing fixes ------------------------
 
%cf4_df_cd = IT_STATS.cf4_df_cd; %(116)
 
%cf4_df_cr = IT_STATS.cf4_df_cr; %(118)

% --- P and x stats -----------------------------

p2need_cf4_s      = IT_STATS.p2need_cf4_s;      %(120)
p2give_cf4_s      = IT_STATS.p2give_cf4_s;      %(122)
 
p2need_cf4_x_s    = IT_STATS.p2need_cf4_x_s;    %(124)

p2give_cf4_x_s    = IT_STATS.p2give_cf4_x_s;    %(126)

p2need_cf4_m      = IT_STATS.p2need_cf4_m;      %(128)
p2give_cf4_m      = IT_STATS.p2give_cf4_m;      %(130)
 
p2need_cf4_x_m    = IT_STATS.p2need_cf4_x_m;    %(132)
 
p2give_cf4_x_m    = IT_STATS.p2give_cf4_x_m;    %(134)

p2need_cf4_dm2s   = IT_STATS.p2need_cf4_dm2s;   %(136)
p2give_cf4_dm2s   = IT_STATS.p2give_cf4_dm2s;   %(138)
 
p2need_cf4_x_dm2s = IT_STATS.p2need_cf4_x_dm2s; %(140)
p2give_cf4_x_dm2s = IT_STATS.p2give_cf4_x_dm2s; %(142)
 
p2need_cf4_sd     = IT_STATS.p2need_cf4_sd;     %(144)
p2give_cf4_sd     = IT_STATS.p2give_cf4_sd;     %(146)
 
p2need_cf4_x_sd   = IT_STATS.p2need_cf4_x_sd;   %(148)
p2give_cf4_x_sd   = IT_STATS.p2give_cf4_x_sd;   %(150)
 
need4_cf4_pc     = IT_STATS.need4_cf4_pc;       %(160)
need2give_cf4_pc = IT_STATS.need2give_cf4_pc;   %(162) 

cf4_vu_m2t_cd = IT_STATS.cf4_vu_m2t_cd;         %(168)
 
cf4_vu_m2t_cr = IT_STATS.cf4_vu_m2t_cr;         %(170)
 
cf4_d_m2t_cd  = IT_STATS.cf4_d_m2t_cd;          %(172)
 
cf4_d_m2t_cr  = IT_STATS.cf4_d_m2t_cr;          %(174)
