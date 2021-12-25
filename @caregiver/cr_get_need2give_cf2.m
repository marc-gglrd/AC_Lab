function [agt,need2give_cf2,p2give_cf2,p2give_cf2_x]=cr_get_need2give_cf2(agt,lab)

%detection-function of need to give cf2 for class CAREGIVER
%agt: caregiver object
%need2give_cf2: true if need to give cf2, 0 otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%GLOBAL VARIABLES
%PRMS_ACLAB: aclab-program parameters
%PRMS_C_CR: CAREGIVER-class parameters
%SIGNALS: data structure containing information that agents need to exchange
     
global  SIGNALS PRMS_ACLAB PRMS_C_CR

%NEED TO GIVE cf2 RULE
%(1) caregiver calculates distance to child (d)
%(2) Pg probability of caregiver giving cf2 to child:
%    Pg = x / (x + cf2_in^x), where x = d * lab_dgr * p2n_cf2
%If Pg > thrshld4_cf2, caregiver will feel need to give cf2

% --- get caregiver properties --------------------------------------
cf2_in        = agt.iwm.cf2_in;    %get caregiving feature
p2give_cf2_x  = agt.p2give_cf2_x;  %get x of Pg
p2give_cf2_xf = agt.p2give_cf2_xf; %get fix for x of Pg
no_cf2_cntr   = agt.no_cf2_cntr;   %get number of iterations without receiving cf2
cf2_ed        = agt.cf2_ed;        %get e-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cd_ndx = find(typ==PRMS_ACLAB.type_cd); %get index of child

p2n_cf2 = SIGNALS.p2need_cf2(cd_ndx);
lab_lns = PRMS_ACLAB.lab_lns; %lab loneliness
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2give_cf2_xf;
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: (cf2_in)*10 ------------
p_curve = PRMS_ACLAB.p_curve_cf2_in;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%cf2_in:      insensitivity
%no_cf2_cntr: number of iterations without receiving cf2 (not cared for counter)
%cf2_ed:      cf2 emotional distance (0 to 100)
%lab_lns:     lab loneliness level (as perceived by the child) (0-1)
%p2n_cf2      probability to need cf2

%------------------------------------------------
y = (no_cf2_cntr * lab_lns);

x = (y)* (1-cf2_in) + coup_co * (1-p2n_cf2) * (cf2_ed/100) +...
    x_fix;
%------------------------------------------------
 
if PRMS_ACLAB.drop_effect
    % --- x drops if last iteration, caregiver gave cf2 -------------
    if no_cf2_cntr == 0
        drop_factor = (1-cf2_in);
        x           = x * drop_factor;
    end
    % ---------------------------------------------------------------
end

% --- threshold parameters ----------------------
x_bl = get_px_th(agt.iwm,p_curve);
max_x = 2*x_bl;

%if strcmp(PRMS_ACLAB.t_def,'f-type')
   
%end

%if strcmp(PRMS_ACLAB.t_def,'n-type')
   
%end

old_x = p2give_cf2_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_cf2 = get_p_thrshld_xx2(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 
                               
PRMS_C_CR.thrshld4_cf2 = thrshld4_cf2;
% -----------------------------------------------

% --- Probability ---------------------------------------------------
Pg = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need to care and update p ----------------------------
if Pg >= thrshld4_cf2
    need2give_cf2 = true; %caregiver needs to give cf2 and gives it
else
    need2give_cf2 = false;
end

p2give_cf2_x = x;
p2give_cf2   = Pg;
% -------------------------------------------------------------------

agt.need2give_cf2 = need2give_cf2;
agt.p2give_cf2_x  = x;
agt.p2give_cf2    = Pg;
  