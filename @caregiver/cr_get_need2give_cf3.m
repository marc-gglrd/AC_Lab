function [agt,need2give_cf3,p2give_cf3,p2give_cf3_x]=cr_get_need2give_cf3(agt,lab)

%detection-function of need to give cf3 for class CAREGIVER
%agt: caregiver object
%need2give_cf3: true if need to give cf3, 0 otherwise
%Created by M.G. Feb 2020
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%GLOBAL VARIABLES
%PRMS_ACLAB: aclab-program parameters
%PRMS_C_CR: CAREGIVER-class parameters
%SIGNALS: data structure containing information that agents need to exchange
     
global  SIGNALS PRMS_ACLAB PRMS_C_CR

%NEED TO GIVE cf3 RULE
%(1) caregiver calculates distance to child (d)
%(2) Pg probability of caregiver giving cf3 to child:
%    Pg = x / (x + cf3_un^x), where x = d * lab_dgr * p2n_cf3
%If Pg > thrshld4_cf3, caregiver will feel need to give cf3

% --- get caregiver properties --------------------------------------
cf3_un        = agt.iwm.cf3_un;    %get caregiving feature
p2give_cf3_x  = agt.p2give_cf3_x;  %get x of Pg
p2give_cf3_xf = agt.p2give_cf3_xf; %get fix for x of Pg
no_cf3_cntr   = agt.no_cf3_cntr;   %get number of iterations without receiving cf3
cf3_pd        = agt.cf3_pd;        %get p-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cd_ndx = find(typ==PRMS_ACLAB.type_cd); %get index of child

p2n_cf3 = SIGNALS.p2need_cf3(cd_ndx);
lab_dgr = PRMS_ACLAB.lab_dgr; %lab danger
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2give_cf3_xf;
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: (cf3_un)*10 ------------
p_curve = PRMS_ACLAB.p_curve_cf3_un;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%cf3_un:      unresponsiveness
%no_cf3_cntr: number of iterations without receiving cf3 (not cared for counter)
%cf3_pd:      cf3 physical  distance (0 to 100)
%lab_dgr:     lab danger level (as perceived by the child) (0-1)
%p2n_cf3      probability to need cf3

%------------------------------------------------
y = (no_cf3_cntr * lab_dgr);

x = y * (1-cf3_un) + coup_co * (1-p2n_cf3) * (cf3_pd/100) +...
    x_fix; 
%------------------------------------------------

if PRMS_ACLAB.drop_effect
    % --- x drops if last iteration, caregiver gave cf3 -------------
    if no_cf3_cntr == 0
        drop_factor = (1-cf3_un);
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

old_x = p2give_cf3_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_cf3 = get_p_thrshld_xx3(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 
                               
PRMS_C_CR.thrshld4_cf3 = thrshld4_cf3;
% -----------------------------------------------
 
% --- Probability ---------------------------------------------------
Pg = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need to care and update p ----------------------------
if Pg >= thrshld4_cf3
    need2give_cf3 = true; %caregiver needs to give cf3 and gives it
else
    need2give_cf3 = false;   
end

p2give_cf3_x = x;
p2give_cf3   = Pg;
% -------------------------------------------------------------------

agt.need2give_cf3 = need2give_cf3;
agt.p2give_cf3_x  = x;
agt.p2give_cf3    = Pg;


    
  


   


