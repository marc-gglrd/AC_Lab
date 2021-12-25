%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf2 plot_stats variables ------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global N_IT IT_STATS
    
p2need_cf2_x  = IT_STATS.p2need_cf2_x;  %(6)
p2give_cf2_x  = IT_STATS.p2give_cf2_x;  %(8)
p2need_cf2_xf = IT_STATS.p2need_cf2_xf; %(10)
p2give_cf2_xf = IT_STATS.p2give_cf2_xf; %(12)
p2need_cf2    = IT_STATS.p2need_cf2;    %(14)
p2give_cf2    = IT_STATS.p2give_cf2;    %(16)

ad2_av        = IT_STATS.ad2_av;        %(18)

cf2_in        = IT_STATS.cf2_in;        %(20)

% --- relevant events ---------------------------
    
need4_cf2     = IT_STATS.need4_cf2;     %(23)
need2give_cf2 = IT_STATS.need2give_cf2; %(25)

n4_n2g_cf2    = IT_STATS.n4_n2g_cf2;    %(27)
n2g_n4_cf2    = IT_STATS.n2g_n4_cf2;    %(29)
n4_n2g_st_cf2 = IT_STATS.n4_n2g_st_cf2; %(31) 
    
n4_nn2g_cf2   = IT_STATS.n4_nn2g_cf2;   %(33)
n2g_nn4_cf2   = IT_STATS.n2g_nn4_cf2;   %(35)
    
% --- relevant event counters -------------------
    
need4_cf2_cntr     = IT_STATS.need4_cf2_cntr;     %(37) 
need2give_cf2_cntr = IT_STATS.need2give_cf2_cntr; %(39)
    
n4_n2g_cf2_cntr    = IT_STATS.n4_n2g_cf2_cntr;    %(41)
n2g_n4_cf2_cntr    = IT_STATS.n2g_n4_cf2_cntr;    %(43)
n4_n2g_st_cf2_cntr = IT_STATS.n4_n2g_st_cf2_cntr; %(45)
      
n4_nn2g_cf2_cntr  = IT_STATS.n4_nn2g_cf2_cntr;    %(47)
n2g_nn4_cf2_cntr  = IT_STATS.n2g_nn4_cf2_cntr;    %(49)

% ---------------------------

no_cf2_cntr       = IT_STATS.no_cf2_cntr;         %(51)

% ---------------------------
no_cf2_ntrs       = IT_STATS.no_cf2_ntrs(N_IT+1); %(53) 
% ---------------------------
no_cf2_ls         = IT_STATS.no_cf2_ls(N_IT+1);   %(55)
% ---------------------------
  
no_cf2_m          = IT_STATS.no_cf2_m;            %(57)
no_cf2_dm2s       = IT_STATS.no_cf2_dm2s;         %(59)
no_cf2_sd         = IT_STATS.no_cf2_sd;           %(61)

 % ---- e-distance ------------------------------

cf2_ed_cd      = IT_STATS.cf2_ed_cd;      %(67)
 
cf2_ed_cr      = IT_STATS.cf2_ed_cr;      %(69)

cf2_ed_cd_s    = IT_STATS.cf2_ed_cd_s;    %(71)
 
cf2_ed_cr_s    = IT_STATS.cf2_ed_cr_s;    %(73)
 
cf2_ed_cd_m    = IT_STATS.cf2_ed_cd_m;    %(75)
 
cf2_ed_cr_m    = IT_STATS.cf2_ed_cr_m;    %(77)

cf2_ed_cd_dm2s = IT_STATS.cf2_ed_cd_dm2s; %(79)
 
cf2_ed_cr_dm2s = IT_STATS.cf2_ed_cr_dm2s; %(81)
 
cf2_ed_cd_sd   = IT_STATS.cf2_ed_cd_sd;   %(83)
 
cf2_ed_cr_sd   = IT_STATS.cf2_ed_cr_sd;   %(85)

 % ---- target e-distance -----------------------
 
cf2_ed_trgt_cd = IT_STATS.cf2_ed_trgt_cd; %(87)
 
cf2_ed_trgt_cr = IT_STATS.cf2_ed_trgt_cr; %(89)

 % ---- indifference ----------------------------
 
cf2_i_cd      = IT_STATS.cf2_i_cd;      %(91)
 
cf2_i_cr      = IT_STATS.cf2_i_cr;      %(93)
 
cf2_i_cd_s    = IT_STATS.cf2_i_cd_s;    %(95)
 
cf2_i_cr_s    = IT_STATS.cf2_i_cr_s;    %(97)
 
cf2_i_cd_m    = IT_STATS.cf2_i_cd_m;    %(99)
 
cf2_i_cr_m    = IT_STATS.cf2_i_cr_m;    %(101)
 
cf2_i_cd_dm2s = IT_STATS.cf2_i_cd_dm2s; %(103)
 
cf2_i_cr_dm2s = IT_STATS.cf2_i_cr_dm2s; %(105)
 
cf2_i_cd_sd   = IT_STATS.cf2_i_cd_sd;   %(107)
 
cf2_i_cr_sd   = IT_STATS.cf2_i_cr_sd;   %(109)
 
 % ---- target indifference ---------------------
 
cf2_i_trgt_cd = IT_STATS.cf2_i_trgt_cd; %(111)
 
cf2_i_trgt_cr = IT_STATS.cf2_i_trgt_cr; %(113)
 
 % ---- indifference ----------------------------
 
%cf2_if_cd = IT_STATS.cf2_if_cd; %(115)
 
%cf2_if_cr = IT_STATS.cf2_if_cr; %(117)

% --- P and x stats -----------------------------

p2need_cf2_s      = IT_STATS.p2need_cf2_s;      %(119)
p2give_cf2_s      = IT_STATS.p2give_cf2_s;      %(121)
 
p2need_cf2_x_s    = IT_STATS.p2need_cf2_x_s;    %(123)

p2give_cf2_x_s    = IT_STATS.p2give_cf2_x_s;    %(125)

p2need_cf2_m      = IT_STATS.p2need_cf2_m;      %(127)
p2give_cf2_m      = IT_STATS.p2give_cf2_m;      %(129)
 
p2need_cf2_x_m    = IT_STATS.p2need_cf2_x_m;    %(131)
 
p2give_cf2_x_m    = IT_STATS.p2give_cf2_x_m;    %(133)

p2need_cf2_dm2s   = IT_STATS.p2need_cf2_dm2s;   %(135)
p2give_cf2_dm2s   = IT_STATS.p2give_cf2_dm2s;   %(137)
 
p2need_cf2_x_dm2s = IT_STATS.p2need_cf2_x_dm2s; %(139)
p2give_cf2_x_dm2s = IT_STATS.p2give_cf2_x_dm2s; %(141)
 
p2need_cf2_sd     = IT_STATS.p2need_cf2_sd;     %(143)
p2give_cf2_sd     = IT_STATS.p2give_cf2_sd;     %(145)
 
p2need_cf2_x_sd   = IT_STATS.p2need_cf2_x_sd;   %(147)
p2give_cf2_x_sd   = IT_STATS.p2give_cf2_x_sd;   %(149)

need4_cf2_pc     = IT_STATS.need4_cf2_pc;       %(159) 

need2give_cf2_pc = IT_STATS.need2give_cf2_pc;   %(161) 

cf2_ed_m2t_cd = IT_STATS.cf2_ed_m2t_cd;         %(167)
 
cf2_ed_m2t_cr = IT_STATS.cf2_ed_m2t_cr;         %(169)

cf2_i_m2t_cd  = IT_STATS.cf2_i_m2t_cd;          %(171)
 
cf2_i_m2t_cr  = IT_STATS.cf2_i_m2t_cr;          %(173)
