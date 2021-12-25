function aclab_go_set(ad_cf,...    %(1) attachment dimension / caregiving feature
                      c_mode,...   %(2) lab configuration mode: 0 standard (fixed), 1 random
                      tot_it,...   %(3) number of total iterations
                      out_intr,... %(4) output interval (print/plot): iterations between outputs (zero for first-last only)                               
                      out_strt,... %(5) output start iteration        (zero for first-last only)
                      out_end,...  %(6) output end   iteration        (zero for first-last only)
                      out_plot,... %(7) output plot -1(no plots)/0(lab)/1(graphs) - default is 1    
                      out_imgs)    %(8) output images true/false - default is false
          
%Sets aclab_go parameters
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET PROGRAM PARAMETERS --------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    global PRMS_ACLAB %aclab-program parameters
    
    PRMS_ACLAB.pv = 'AC_Lab v1.0 [20/12/2021]'; %program and version
    
    %%% --- LAB-CHILD-CAREGIVER PARAMETERS --------------------------
    
    %%% -------------------------------------------------------------
    %%% --- Av/In - Am/Un - Ph/Li Setting ---------------------------
    %%% -------------------------------------------------------------
    
    %same initial child avoidance   & caregiver insensitivity /
    %same initial child ambivalence & caregiver unresponsiveness /
    %same initial child phobicity   & caregiver limitation
    
    aclab_go_set_select % select active dimension and its value (m-file)
       
    % -------------------------------------------
    PRMS_ACLAB.ad2_av = PRMS_ACLAB.ad2_cf2; %initial child avoidance   [attachment dimension 2: avoidance]
    PRMS_ACLAB.ad3_am = PRMS_ACLAB.ad3_cf3; %initial child ambivalence [attachment dimension 3: ambivalence]
    PRMS_ACLAB.ad4_ph = PRMS_ACLAB.ad4_cf4; %initial child phobicity   [attachment dimension 4: phobicity]
    
    PRMS_ACLAB.cf2_in = PRMS_ACLAB.ad2_cf2; %caregiver insensitivity    [caregiving feature 2: insensitivity]
    PRMS_ACLAB.cf3_un = PRMS_ACLAB.ad3_cf3; %caregiver unresponsiveness [caregiving feature 3: unresponsiveness]
    PRMS_ACLAB.cf4_li = PRMS_ACLAB.ad4_cf4; %caregiver limitation       [caregiving feature 4: limitation]
    % -------------------------------------------
    
    % --- last need -----------------------
    %if true, action is decided upon last iteration need (as opposed to current iteration need)
    PRMS_ACLAB.last_need = false;
    %PRMS_ACLAB.last_need = true;
    % -------------------------------------
    
    % --- drop effest ---------------------
    %if true, drops probability when counter is zero
    PRMS_ACLAB.drop_effect = false;
    %PRMS_ACLAB.drop_effect = true;
    % --- bias effest ---------------------
    %if true, applies bias to new xd (emotional/physical distance)
    PRMS_ACLAB.bias_effect = false;
    %PRMS_ACLAB.bias_effect = true;
    % -------------------------------------
    
    % --- P Threshold ---------------------
    PRMS_ACLAB.thrshld = 0.75;
    PRMS_ACLAB.drop_effect_th = true;
    PRMS_ACLAB.drop_effect_th_xx2 = 0.08;
    PRMS_ACLAB.drop_effect_th_xx3 = 0.08;
    PRMS_ACLAB.drop_effect_th_xx4 = 0.08;
    
    % --- ed & pd-tolerance ---------------
    PRMS_ACLAB.ed_tlrnc = 1.01;%1.1;%1.05;
    PRMS_ACLAB.pd_tlrnc = 1.10;%1.01;
    PRMS_ACLAB.vu_tlrnc = 1.01;%1.01;
    % -------------------------------------
    
    PRMS_ACLAB.CD_CNTR = 0;
    PRMS_ACLAB.CR_CNTR = 0;
       
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % --- CHILD & CAREGIVER INDIFFERENCE (i) & DISTANCING (d) -----------
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %child:     i = 100 * cr-explorations / (tot. iterations)     
    %child:     d = lab distance                                  
    %caregiver: i = 100 * cr-explorations / (tot. iterations) 
    %caregiver: d = lab distance                             
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % -------------------------------------------------------------------
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%% -------------------------------------------------------------
    %%% --- size, obj, dgr, lns Setting -----------------------------
    %%% -------------------------------------------------------------
    
    PRMS_ACLAB.size      = 30;  %lab size in chosen units (e.g. meters)
                                %actual size is size-1 (coordinates start at 1 (not 0))
    PRMS_ACLAB.obj4cd_n  = 3;   %number of objects to which the child is interested for exploration
    PRMS_ACLAB.obj4cr_n  = 3;   %number of objects to which the caregiver is interested for exploration
    PRMS_ACLAB.lab_lns   = 0.5; %lab loneliness level (as perceived by the child) (0-1)
    PRMS_ACLAB.lab_dgr   = 0.5; %lab danger     level (as perceived by the child) (0-1)
    %coupling coefficient
    if strcmp(ad_cf(1:2),'av')
        PRMS_ACLAB.coup_co = 4.0;%-AVOIDANCE-   OK 4.0
    elseif strcmp(ad_cf(1:2),'am')
        PRMS_ACLAB.coup_co = 2.0;%-AMBIVALENCE- OK 2.0
    elseif strcmp(ad_cf(1:2),'ph')
        PRMS_ACLAB.coup_co = 1.5;%-PHOBICITY-   OK 1.0
    end
    
    variable_xf = false;
    %variable_xf = true;
    
    if variable_xf
    %%% --- variable xf ---------------------------------------------
        %- formulas
        vf_ad_2 = 2.0;
        vf_cf_2 = 2.0;
        vf_ad_3 = 2.0;
        vf_cf_3 = 2.0;
        vf_ad_4 = 2.0;
        vf_cf_4 = 2.0;
        %- ad2-cf2 lines
        m_ad_2 = -0.30; %-0.30 OK
        q_ad_2 = +0.60; %+0.60 OK
        m_cf_2 = -0.30; %-0.30 OK
        q_cf_2 = +0.59; %+0.59 OK
        %- ad3-cf3 lines
        m_ad_3 = +0.65; %+0.65 OK 
        q_ad_3 = -0.30; %-0.30 OK
        m_cf_3 = -0.60; %-0.60 OK
        q_cf_3 = +0.85; %+0.85 OK
        %- ad4-cf4 lines
        m_ad_4 = -0.10;
        q_ad_4 = +0.50;
        m_cf_4 = -0.10;
        q_cf_4 = +0.50;
        get_xf_array = true;
    else
    %%% --- constant xf ---------------------------------------------
    
    %--- ad2-cf2 --- %-AVOIDANCE-
    f_ad_2 = 0.49; %OK 0.49
    f_cf_2 = 0.50; %OK 0.50
    %--- ad3-cf3 --- %-AMBIVALENCE-
    f_ad_3 = 0.20; %OK 0.20
    f_cf_3 = 0.50; %OK 0.50
    %--- ad4-cf4 --- %-PHOBICITY-
    f_ad_4 = 0.47; %OK 0.47
    f_cf_4 = 0.50; %OK 0.50
    
    end
    
    % ---------------------------------------------------------------
    
    PRMS_ACLAB.maxi = 100; %max indifference a child/caregiver can show to a caregiver/child
    PRMS_ACLAB.maxd = sqrt((PRMS_ACLAB.size-1)^2+...%maximum distance in the lab
                           (PRMS_ACLAB.size-1)^2);  %is actually sqrt((size-1)^2+(size-1)^2)
    PRMS_ACLAB.emaxd = sqrt((PRMS_ACLAB.size)^2+...%enhanced maxd
                            (PRMS_ACLAB.size)^2);  %used to calculate speed & ex_range
                     
    PRMS_ACLAB.mind = 2.4;

    PRMS_ACLAB.i_trgt_ad2_k = 1.1;  %fraction of maxi considered to calculate child     target indifference
    PRMS_ACLAB.i_trgt_cf2_k = 1.1;  %fraction of maxi considered to calculate caregiver target indifference
    PRMS_ACLAB.d_trgt_ad3_k = 0.24; %fraction of maxd considered to calculate child     target distancing
    PRMS_ACLAB.d_trgt_cf3_k = 0.24; %fraction of maxd considered to calculate caregiver target distancing
    PRMS_ACLAB.d_trgt_ad4_k = 0.24; %fraction of maxd considered to calculate child     target distancing
    PRMS_ACLAB.d_trgt_cf4_k = 0.24; %fraction of maxd considered to calculate caregiver target distancing
  
    % ---------------------------------------------------------------
    
    PRMS_ACLAB.cd_explore  = false; %true when child     explores,   false otherwise
    PRMS_ACLAB.cd_approach = false; %true when child     approaches, false otherwise
    PRMS_ACLAB.cr_explore  = false; %true when caregiver explores,   false otherwise
    PRMS_ACLAB.cr_approach = false; %true when caregiver approaches, false otherwise
          
    %%% -------------------------------------------------------------
    %%% -------------------------------------------------------------
    %%% -------------------------------------------------------------
    
    PRMS_ACLAB.type_cd = 1; %agent type child
    PRMS_ACLAB.type_cr = 2; %agent type caregiver
    PRMS_ACLAB.type_sr = 3; %agent type stranger

    PRMS_ACLAB.n_cd = 1; %initializes number of children (always 1 - child does not leave)
    PRMS_ACLAB.n_cr = 1; %initializes number of caregivers
    PRMS_ACLAB.n_sr = 0; %initializes number of strangers
       
    %%% --- DEFAULT PROGRAM PARAMETERS ------------------------------
    
    PRMS_ACLAB.c_mode_sd = 0; %standard configuration mode
    PRMS_ACLAB.c_mode_rm = 1; %random configuration mode
    
    PRMS_ACLAB.ad_cf    = 'av01';               %parameter 1
    PRMS_ACLAB.c_mode   = PRMS_ACLAB.c_mode_sd; %parameter 2
    PRMS_ACLAB.tot_it   = 20;                   %parameter 3
    PRMS_ACLAB.out_intr = 0;                    %parameter 4
    PRMS_ACLAB.out_strt = 0;                    %parameter 5
    PRMS_ACLAB.out_end  = 0;                    %parameter 6
    PRMS_ACLAB.out_plot = 1;                    %parameter 7
    PRMS_ACLAB.out_imgs = false;                %parameter 8
    
    if nargin == 0
    elseif nargin == 1
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
    elseif nargin == 2
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
    elseif nargin == 3
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
    elseif nargin == 4
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
        PRMS_ACLAB.out_intr = out_intr;  %parameter 4
    elseif nargin == 5
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
        PRMS_ACLAB.out_intr = out_intr;  %parameter 4
        PRMS_ACLAB.out_strt = out_strt;  %parameter 5
    elseif nargin == 6
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
        PRMS_ACLAB.out_intr = out_intr;  %parameter 4
        PRMS_ACLAB.out_strt = out_strt;  %parameter 5
        PRMS_ACLAB.out_end  = out_end;   %parameter 6
    elseif nargin == 7
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
        PRMS_ACLAB.out_intr = out_intr;  %parameter 4
        PRMS_ACLAB.out_strt = out_strt;  %parameter 5
        PRMS_ACLAB.out_end  = out_end;   %parameter 6
        PRMS_ACLAB.out_plot = out_plot;  %parameter 7
    elseif nargin == 8
        PRMS_ACLAB.ad_cf    = ad_cf;     %parameter 1
        PRMS_ACLAB.c_mode   = c_mode;    %parameter 2
        PRMS_ACLAB.tot_it   = tot_it;    %parameter 3
        PRMS_ACLAB.out_intr = out_intr;  %parameter 4
        PRMS_ACLAB.out_strt = out_strt;  %parameter 5
        PRMS_ACLAB.out_end  = out_end;   %parameter 6
        PRMS_ACLAB.out_plot = out_plot;  %parameter 7
        PRMS_ACLAB.out_imgs = out_imgs;  %parameter 8
    end  
    
    %%% --- set program control ---------------------------
    
    % - control parameter for random/non-random simulation 
    %true  for random simulation 
    %false for simulation identical to previous one (for same initial values)
    
    %PRMS_ACLAB.rndm_smltn = true; 
    %PRMS_ACLAB.rndm_smltn = false;
    
    % - print-screen control
    PRMS_ACLAB.report_only = false; %when true, only report printed on screen (no iteration log)
        
    % - control parameters for PRMS_ACLAB.out_intr (plot display rate)
    %(speed up the code during experimental testing in plot_results)
    
    % - path for saving plots
    PRMS_ACLAB.plot_path = '.\OUTPUT_PLOTS_CURRENT\';
    
    % -----------------------------------------------------
    % --- Decide if plotting only the active dimensions ---
    % -----------------------------------------------------
    
    PRMS_ACLAB.selective_plots = true;
    %if true,  only the active dimensions are plotted
    %if false, everything is plotted
        
    % -----------------------------------------------------
    % --- OUTPUT VECTOR -----------------------------------
    % -----------------------------------------------------
    output_vector_size = 36;
    PRMS_ACLAB.final_report_out = zeros(output_vector_size,2);
    for i=1:output_vector_size
        PRMS_ACLAB.final_report_out(i,1) = i;
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET LAB PARAMETERS ------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global PRMS_C_LAB %LAB-class parameters

PRMS_C_LAB.shape = 'square';                              %(1)
PRMS_C_LAB.unit  = 'meter';                               %(2)
PRMS_C_LAB.size = PRMS_ACLAB.size;                        %(3)
PRMS_C_LAB.out_pos  = [-1 -1];                            %(4)
PRMS_C_LAB.door_pos = [1 round(PRMS_ACLAB.size/2)];       %(5)

%lab field
%actual field is size-1 x size-1 (1st cordinate is 1, not 0)
PRMS_C_LAB.field = ones(PRMS_ACLAB.size,PRMS_ACLAB.size); %(6)
PRMS_C_LAB.empty_field = 55; %grey                        %(7)

%objects
PRMS_C_LAB.obj4cd      = 11; %white                       %(8)
PRMS_C_LAB.obj4cr      = 99; %black                       %(9)
PRMS_C_LAB.obj4cd_n = PRMS_ACLAB.obj4cd_n;                %(10)
PRMS_C_LAB.obj4cr_n = PRMS_ACLAB.obj4cr_n;                %(11)
PRMS_C_LAB.obj4cd_pos = zeros(1,2,PRMS_ACLAB.obj4cd_n);   %(12)
PRMS_C_LAB.obj4cr_pos = zeros(1,2,PRMS_ACLAB.obj4cr_n);   %(13)

%max exploration of object
%(how many iterations of interest for agent)
PRMS_C_LAB.obj4cd_mex = 1;                                %(14)
PRMS_C_LAB.obj4cr_mex = 1;                                %(15)
%max interval for re-exploring object
%(after how many iterations of interest again for agent)
PRMS_C_LAB.obj4cd_xint = 7;                               %(16)
PRMS_C_LAB.obj4cr_xint = 7;                               %(17)

PRMS_C_LAB.obj4cd_xc  = ones(1,PRMS_ACLAB.obj4cd_n);      %(18)
PRMS_C_LAB.obj4cr_xc  = ones(1,PRMS_ACLAB.obj4cr_n);      %(19)
PRMS_C_LAB.obj4cd_xic = zeros(1,PRMS_ACLAB.obj4cd_n);     %(20)
PRMS_C_LAB.obj4cr_xic = zeros(1,PRMS_ACLAB.obj4cr_n);     %(21)
PRMS_C_LAB.obj4cd_act = true(1,PRMS_ACLAB.obj4cd_n);      %(22)
PRMS_C_LAB.obj4cr_act = true(1,PRMS_ACLAB.obj4cr_n);      %(23)
          
%%% set field to empty field %%%%%%%%%%%%%%%%%%%%
PRMS_C_LAB.field = (PRMS_C_LAB.empty_field).*(PRMS_C_LAB.field);
%%% set counters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PRMS_C_LAB.obj4cd_xc = (PRMS_C_LAB.obj4cd_mex).*(PRMS_C_LAB.obj4cd_xc);
PRMS_C_LAB.obj4cr_xc = (PRMS_C_LAB.obj4cr_mex).*(PRMS_C_LAB.obj4cr_xc);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_LAB.cd_pos  = [];                                  %(24) --- INITIALIZED BELOW ---
PRMS_C_LAB.cr_pos  = [];                                  %(25) --- INITIALIZED BELOW ---
PRMS_C_LAB.cd_cr_d = [];                                  %(26) --- INITIALIZED BELOW ---


global PRMS_C_CD %CHILD-class parameters
global PRMS_C_CR %CAREGIVER-class parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CHILD PARAMETERS ----------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_CD.pos      = [];                 %(1)  --- INITIALIZED BELOW ---

PRMS_C_CD.speed    = PRMS_ACLAB.emaxd/9; %(2) distance the child can move in each direction per iteration
PRMS_C_CD.ex_range = PRMS_ACLAB.emaxd/3; %(3) how far the child can see

PRMS_C_CD.ad2_av = PRMS_ACLAB.ad2_av; %(4a) AVOIDANCE   <-------
PRMS_C_CD.ad3_am = PRMS_ACLAB.ad3_am; %(4b) AMBIVALENCE <+++++++
PRMS_C_CD.ad4_ph = PRMS_ACLAB.ad4_ph; %(4c) PHOBICITY   <///////

% --- p_curve -----------------------------------
PRMS_ACLAB.p_curve_ad2_av =    PRMS_C_CD.ad2_av *10;
PRMS_ACLAB.p_curve_ad3_am = (1-PRMS_C_CD.ad3_am)*10;
PRMS_ACLAB.p_curve_ad4_ph = (1-PRMS_C_CD.ad4_ph)*10;
% -----------------------------------------------

PRMS_C_CD.thrshld4_ad2  = PRMS_ACLAB.thrshld; %(4c)
PRMS_C_CD.thrshld4_ad3  = PRMS_ACLAB.thrshld; %(4d)
PRMS_C_CD.thrshld4_ad4  = PRMS_ACLAB.thrshld; %(4e)
PRMS_C_CD.need4_cf2     = false;              %(5)
PRMS_C_CD.need4_cf3     = false;              %(6)
PRMS_C_CD.need4_cf4     = false;              %(6+)

% --- create iwm object to call its methods ---
wm = iwm(); 
% ---------------------------------------------

%%% Initial drive
PRMS_C_CD.p2need_cf2_x  = get_px_th(wm,PRMS_ACLAB.p_curve_ad2_av); %(7)
PRMS_C_CD.p2need_cf3_x  = get_px_th(wm,PRMS_ACLAB.p_curve_ad3_am); %(8)
PRMS_C_CD.p2need_cf4_x  = get_px_th(wm,PRMS_ACLAB.p_curve_ad4_ph); %(8+)
% PRMS_C_CD.p2need_cf2_x  = get_px_md(wm,PRMS_ACLAB.p_curve_ad2_av); %(7)
% PRMS_C_CD.p2need_cf3_x  = get_px_md(wm,PRMS_ACLAB.p_curve_ad3_am); %(8)
% PRMS_C_CD.p2need_cf4_x  = get_px_md(wm,PRMS_ACLAB.p_curve_ad4_ph); %(8+)

PRMS_C_CD.p2need_cf2_xf = [];         %(9)  --- INITIALIZED BELOW ---                                      
PRMS_C_CD.p2need_cf3_xf = [];         %(10) --- INITIALIZED BELOW ---
PRMS_C_CD.p2need_cf4_xf = [];         %(10+)--- INITIALIZED BELOW ---

PRMS_C_CD.p2need_cf2 = round(get_p(wm,PRMS_ACLAB.p_curve_ad2_av,PRMS_C_CD.p2need_cf2_x),2); %(11)
PRMS_C_CD.p2need_cf3 = round(get_p(wm,PRMS_ACLAB.p_curve_ad3_am,PRMS_C_CD.p2need_cf3_x),2); %(12) 
PRMS_C_CD.p2need_cf4 = round(get_p(wm,PRMS_ACLAB.p_curve_ad4_ph,PRMS_C_CD.p2need_cf4_x),2); %(12+) 
                    
PRMS_C_CD.no_cf2_cntr   = 0;          %(13)
PRMS_C_CD.no_cf3_cntr   = 0;          %(14)
PRMS_C_CD.no_cf4_cntr   = 0;          %(14+)

PRMS_C_CD.cf2_ed        = [];         %(15) --- INITIALIZED BELOW ---                 
PRMS_C_CD.cf3_pd        = [];         %(16) --- INITIALIZED BELOW ---
PRMS_C_CD.cf4_vu        = [];         %(16+)--- INITIALIZED BELOW ---
PRMS_C_CD.cf2_ed_trgt   = [];         %(17) --- INITIALIZED BELOW ---
PRMS_C_CD.cf3_pd_trgt   = [];         %(18) --- INITIALIZED BELOW ---
PRMS_C_CD.cf4_vu_trgt   = [];         %(18+)--- INITIALIZED BELOW ---
PRMS_C_CD.cf2_i         = [];         %(19) --- INITIALIZED BELOW ---
PRMS_C_CD.cf3_d         = [];         %(20) --- INITIALIZED BELOW ---
PRMS_C_CD.cf4_d         = [];         %(20+)--- INITIALIZED BELOW ---
PRMS_C_CD.cf2_i_trgt    = [];         %(21) --- INITIALIZED BELOW ---
PRMS_C_CD.cf3_d_trgt    = [];         %(22) --- INITIALIZED BELOW ---
PRMS_C_CD.cf4_d_trgt    = [];         %(22+)--- INITIALIZED BELOW ---
PRMS_C_CD.cf2_if        = [];         %(23) --- INITIALIZED BELOW ---
PRMS_C_CD.cf3_df        = [];         %(24) --- INITIALIZED BELOW ---  
PRMS_C_CD.cf4_df        = [];         %(24+)--- INITIALIZED BELOW ---      

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CAREGIVER PARAMETERS ------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_CR.pos           = [];                %(1)  --- INITIALIZED BELOW ---

PRMS_C_CR.speed         = PRMS_ACLAB.emaxd/3; %(2) distance the caregiver can move in each direction per iteration
PRMS_C_CR.ex_range      = PRMS_ACLAB.emaxd/1; %(3) how far the caregiver can see

PRMS_C_CR.cf2_in = PRMS_ACLAB.cf2_in; %(4a) INSENSITIVITY    <-------
PRMS_C_CR.cf3_un = PRMS_ACLAB.cf3_un; %(4b) UNRESPONSIVENESS <+++++++
PRMS_C_CR.cf4_li = PRMS_ACLAB.cf4_li; %(4c) LIMITATION       <///////

% --- p_curve -----------------------------------
PRMS_ACLAB.p_curve_cf2_in = PRMS_C_CR.cf2_in*10;
PRMS_ACLAB.p_curve_cf3_un = PRMS_C_CR.cf3_un*10;
PRMS_ACLAB.p_curve_cf4_li = (1-PRMS_C_CR.cf4_li)*10;
% -----------------------------------------------

PRMS_C_CR.thrshld4_cf2  = PRMS_ACLAB.thrshld; %(4c)
PRMS_C_CR.thrshld4_cf3  = PRMS_ACLAB.thrshld; %(4d)
PRMS_C_CR.thrshld4_cf4  = PRMS_ACLAB.thrshld; %(4e)
PRMS_C_CR.need2give_cf2 = false;              %(5)
PRMS_C_CR.need2give_cf3 = false;              %(6)
PRMS_C_CR.need2give_cf4 = false;              %(6+)

% --- create iwm object to call its methods ---
wm = iwm(); 
% ---------------------------------------------

%%% Initial drive
PRMS_C_CR.p2give_cf2_x  = get_px_th(wm,PRMS_ACLAB.p_curve_cf2_in); %(7)
PRMS_C_CR.p2give_cf3_x  = get_px_th(wm,PRMS_ACLAB.p_curve_cf3_un); %(8)
PRMS_C_CR.p2give_cf4_x  = get_px_th(wm,PRMS_ACLAB.p_curve_cf4_li); %(8+)
% PRMS_C_CR.p2give_cf2_x  = get_px_md(wm,PRMS_ACLAB.p_curve_cf2_in); %(7)
% PRMS_C_CR.p2give_cf3_x  = get_px_md(wm,PRMS_ACLAB.p_curve_cf3_un); %(8)
% PRMS_C_CR.p2give_cf4_x  = get_px_md(wm,PRMS_ACLAB.p_curve_cf4_li); %(8+)

PRMS_C_CR.p2give_cf2_xf = [];         %(9)  --- INITIALIZED BELOW ---                                      
PRMS_C_CR.p2give_cf3_xf = [];         %(10) --- INITIALIZED BELOW ---  
PRMS_C_CR.p2give_cf4_xf = [];         %(10+)--- INITIALIZED BELOW ---

PRMS_C_CR.p2give_cf2 = round(get_p(wm,PRMS_ACLAB.p_curve_cf2_in,PRMS_C_CR.p2give_cf2_x),2); %(11)
PRMS_C_CR.p2give_cf3 = round(get_p(wm,PRMS_ACLAB.p_curve_cf3_un,PRMS_C_CR.p2give_cf3_x),2); %(12)
PRMS_C_CR.p2give_cf4 = round(get_p(wm,PRMS_ACLAB.p_curve_cf4_li,PRMS_C_CR.p2give_cf4_x),2); %(12+)
                    
PRMS_C_CR.no_cf2_cntr   = 0;          %(13)
PRMS_C_CR.no_cf3_cntr   = 0;          %(14)
PRMS_C_CR.no_cf4_cntr   = 0;          %(14+)

PRMS_C_CR.cf2_ed        = [];         %(15) --- INITIALIZED BELOW ---                 
PRMS_C_CR.cf3_pd        = [];         %(16) --- INITIALIZED BELOW ---
PRMS_C_CR.cf4_vu        = [];         %(16+)--- INITIALIZED BELOW ---
PRMS_C_CR.cf2_ed_trgt   = [];         %(17) --- INITIALIZED BELOW ---
PRMS_C_CR.cf3_pd_trgt   = [];         %(18) --- INITIALIZED BELOW ---
PRMS_C_CR.cf4_vu_trgt   = [];         %(18+)--- INITIALIZED BELOW ---
PRMS_C_CR.cf2_i         = [];         %(19) --- INITIALIZED BELOW ---
PRMS_C_CR.cf3_d         = [];         %(20) --- INITIALIZED BELOW ---
PRMS_C_CR.cf4_d         = [];         %(20+)--- INITIALIZED BELOW ---
PRMS_C_CR.cf2_i_trgt    = [];         %(21) --- INITIALIZED BELOW ---
PRMS_C_CR.cf3_d_trgt    = [];         %(22) --- INITIALIZED BELOW ---
PRMS_C_CR.cf4_d_trgt    = [];         %(22+)--- INITIALIZED BELOW ---
PRMS_C_CR.cf2_if        = [];         %(23) --- INITIALIZED BELOW ---
PRMS_C_CR.cf3_df        = [];         %(24) --- INITIALIZED BELOW --- 
PRMS_C_CR.cf4_df        = [];         %(24+)--- INITIALIZED BELOW --- 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CHILD PARAMETERS 17,18,21,22 ----------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- CHILD TARGET E-DISTANCE/INDIFFERENCE --------------------------
PRMS_C_CD.cf2_ed_trgt = 100*(PRMS_C_CD.ad2_av);       %(17) target e-distance
PRMS_C_CD.cf2_i_trgt  = 1.1 * PRMS_C_CD.cf2_ed_trgt;  %(21) target indifference

% --- CHILD TARGET P-DISTANCE/DISTANCING ----------------------------
PRMS_C_CD.cf3_pd_trgt = 100*(1-PRMS_C_CD.ad3_am);     %(18) target p-distance
PRMS_C_CD.cf3_d_trgt  = 0.24 * PRMS_C_CD.cf3_pd_trgt; %(22) target distancing [defines mtd]

% --- CHILD TARGET VULNERABILITY/DISTANCING -------------------------
PRMS_C_CD.cf4_vu_trgt = 100*(1-PRMS_C_CD.ad4_ph);     %(18+) target vulnerability
PRMS_C_CD.cf4_d_trgt  = 0.24 * PRMS_C_CD.cf4_vu_trgt; %(22+) target distancing    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CAREGIVER PARAMETERS 17,18,21,22 ------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                 

% --- CAREGIVER TARGET E-DISTANCE/INDIFFERENCE ----------------------
PRMS_C_CR.cf2_ed_trgt = 100*(PRMS_C_CR.cf2_in);       %(17) target e-distance
PRMS_C_CR.cf2_i_trgt  = 1.1 * PRMS_C_CR.cf2_ed_trgt;  %(21) target indifference

% --- CAREGIVER TARGET P-DISTANCE/DISTANCING ------------------------
PRMS_C_CR.cf3_pd_trgt = 100*(PRMS_C_CR.cf3_un);       %(18) target p-distance
PRMS_C_CR.cf3_d_trgt  = 0.24 * PRMS_C_CR.cf3_pd_trgt; %(22) target distancing [defines mtd]

% --- CAREGIVER TARGET P-DISTANCE/DISTANCING ------------------------
PRMS_C_CR.cf4_vu_trgt = 100*(1-PRMS_C_CR.cf4_li);     %(18+) target vulnerability
PRMS_C_CR.cf4_d_trgt  = 0.24 * PRMS_C_CR.cf4_vu_trgt; %(22+) target distancing 

% -------------------------------------------------------------------
% -------------------------------------------------------------------
% --- CHILD & CAREGIVER STANDARD LAB POSITIONS & DISTANCE -----------
% -------------------------------------------------------------------
% -------------------------------------------------------------------
    %half size
    hs  = PRMS_C_LAB.size/2;
    %mean target distance - uses cf3_d_trgt 
    mtd = (PRMS_C_CD.cf3_d_trgt + PRMS_C_CR.cf3_d_trgt)/2;
    
    %--------------------------------------------------

    cd_x = hs - (mtd/2); %child x (standard) position
    cd_y = hs;           %child y (standard) position

    cr_x = hs + (mtd/2); %caregiver x (standard) position
    cr_y = hs;           %caregiver y (standard) position

    d = sqrt((cd_x-cr_x)^2+(cd_y-cr_y)^2); %child-caregiver lab distance

    ncd = PRMS_ACLAB.n_cd;
    ncr = PRMS_ACLAB.n_cr;

    cd_pos = [cd_x,cd_y].*ones(ncd,2); %initial child     (standard) position [x,y]  [9, 15]
    cr_pos = [cr_x,cr_y].*ones(ncr,2); %initial caregiver (standard) position [x,y] [21, 15]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET LAB PARAMETERS 24,25,26 ---------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_LAB.cd_pos  = cd_pos; %(24) child     (standard) position [x,y]
PRMS_C_LAB.cr_pos  = cr_pos; %(25) caregiver (standard) position [x,y]
PRMS_C_LAB.cd_cr_d = d;      %(26) child-caregiver (standard) lab distance

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CHILD PARAMETERS 1,9,10,15,16,19,20,23,24 ---------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_CD.pos = cd_pos; %(1) child (standard) position [x,y]

% PRMS_C_CD.cf2_i = PRMS_C_CD.cf2_i_trgt; %(19) indifference to the caregiver
% PRMS_C_CD.cf3_d = PRMS_C_CD.cf3_d_trgt; %(20) distancing   to the caregiver
% PRMS_C_CD.cf4_d = PRMS_C_CD.cf4_d_trgt; %(20+)distancing   to the caregiver

PRMS_C_CD.cf3_d = PRMS_C_LAB.cd_cr_d;
PRMS_C_CD.cf4_d = PRMS_C_LAB.cd_cr_d;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- x_fix_ad2 ---- CHILD ad2 - Avoidance
                  
if variable_xf                    
    PRMS_C_CD.p2need_cf2_xf = m_ad_2*PRMS_C_CD.ad2_av+q_ad_2;
else
    PRMS_C_CD.p2need_cf2_xf = f_ad_2;
end
                      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- x_fix_ad3 ---- CHILD ad3 - Ambivalence
                    
if variable_xf
    PRMS_C_CD.p2need_cf3_xf = m_ad_3*PRMS_C_CD.ad3_am+q_ad_3;
else
    PRMS_C_CD.p2need_cf3_xf = f_ad_3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- x_fix_ad4 ---- CHILD ad4 - Phobicity

if variable_xf                    
    PRMS_C_CD.p2need_cf4_xf = m_ad_4*PRMS_C_CD.ad4_ph+q_ad_4;
else
    PRMS_C_CD.p2need_cf4_xf = f_ad_4;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- SET CAREGIVER PARAMETERS 1,9,10,15,16,19,20,23,24 -----------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_CR.pos = cr_pos; %(1) caregiver (standard) position [x,y]

% PRMS_C_CR.cf2_i = PRMS_C_CR.cf2_i_trgt; %(19) indifference to the child
% PRMS_C_CR.cf3_d = PRMS_C_CR.cf3_d_trgt; %(20) distancing   to the child
% PRMS_C_CR.cf4_d = PRMS_C_CR.cf4_d_trgt; %(20+)distancing   to the child

PRMS_C_CR.cf3_d = PRMS_C_LAB.cd_cr_d;
PRMS_C_CR.cf4_d = PRMS_C_LAB.cd_cr_d;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- x_fix_cf2 --- CAREGIVER cf2 - Insensitivity         

if variable_xf
    PRMS_C_CR.p2give_cf2_xf = m_cf_2*PRMS_C_CR.cf2_in+q_cf_2;                   
else
    PRMS_C_CR.p2give_cf2_xf = f_cf_2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
% --- x_fix_cf3 --- CAREGIVER cf3 - Unresponsiveness

if variable_xf
    PRMS_C_CR.p2give_cf3_xf = m_cf_3*PRMS_C_CR.cf3_un+q_cf_3;                     
else
    PRMS_C_CR.p2give_cf3_xf = f_cf_3;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- x_fix_cf4 --- CAREGIVER cf4 - Limitation

if variable_xf
    PRMS_C_CR.p2give_cf4_xf = m_cf_4*PRMS_C_CR.cf4_li+q_cf_4;                      
else
    PRMS_C_CR.p2give_cf4_xf = f_cf_4;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- LAB DISTANCE CHECK ------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if PRMS_C_LAB.cd_cr_d ~= PRMS_C_CD.cf3_d ||...
       PRMS_C_LAB.cd_cr_d ~= PRMS_C_CR.cf3_d ||...
       PRMS_C_LAB.cd_cr_d ~= PRMS_C_CD.cf4_d ||...
       PRMS_C_LAB.cd_cr_d ~= PRMS_C_CR.cf4_d
        return
        disp('Lab Distance Must Be Set Equal For Lab, Child & Caregiver ')
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- set uniform initial conditions ------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PRMS_C_CD.cf2_i = 55;PRMS_C_CD.cf2_i_trgt; %(19) indifference to the caregiver
PRMS_C_CD.cf3_d = 12;PRMS_C_CD.cf3_d_trgt; %(20) distancing   to the caregiver
PRMS_C_CD.cf4_d = 12;PRMS_C_CD.cf4_d_trgt; %(20+)distancing   to the caregiver

PRMS_C_CR.cf2_i = 55;PRMS_C_CR.cf2_i_trgt; %(19) indifference to the child
PRMS_C_CR.cf3_d = 12;PRMS_C_CR.cf3_d_trgt; %(20) distancing   to the child
PRMS_C_CR.cf4_d = 12;PRMS_C_CR.cf4_d_trgt; %(20+)distancing   to the child

PRMS_C_CD.cf2_ed = 50;                     %(15) e-distance to the caregiver
PRMS_C_CD.cf3_pd = 50;                     %(16) p-distance to the caregiver
PRMS_C_CD.cf4_vu = 50;                     %(16+)child's vulnerability

PRMS_C_CR.cf2_ed = 50;                     %(15) e-distance to the child
PRMS_C_CR.cf3_pd = 50;                     %(16) p-distance to the child
PRMS_C_CR.cf4_vu = 50;                     %(16+)caregiver's vulnerability
                 
                 
            


