function [agt,need2give_cf4,p2give_cf4,p2give_cf4_x]=cr_get_need2give_cf4(agt,lab)

%detection-function of need to give cf4 for class CAREGIVER
%agt: caregiver object
%need2give_cf4: true if need to give cf4, 0 otherwise
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

%NEED TO GIVE cf4 RULE
%(1) caregiver calculates distance to child (d)
%(2) Pg probability of caregiver giving cf4 to child:
%    Pg = x / (x + cf4_li^x), where x = d * lab_dgr * p2n_cf4
%If Pg > thrshld4_cf4, caregiver will feel need to give cf4

% --- get caregiver properties --------------------------------------
cf4_li        = agt.iwm.cf4_li;    %get caregiving feature
p2give_cf4_x  = agt.p2give_cf4_x;  %get x of Pg
p2give_cf4_xf = agt.p2give_cf4_xf; %get fix for x of Pg
no_cf4_cntr   = agt.no_cf4_cntr;   %get number of iterations without receiving cf4
cf4_vu        = agt.cf4_vu;        %get p-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cd_ndx = find(typ==PRMS_ACLAB.type_cd); %get index of child

p2n_cf4 = SIGNALS.p2need_cf4(cd_ndx);
lab_dgr = PRMS_ACLAB.lab_dgr; %lab danger
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2give_cf4_xf;
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: (cf4_li)*10 ------------
p_curve = PRMS_ACLAB.p_curve_cf4_li;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%cf4_li:      limitation
%no_cf4_cntr: number of iterations without receiving cf4 (not cared for counter)
%cf4_vu:      cf4 vulnerability (0 to 100)
%lab_dgr:     lab danger level (as perceived by the child) (0-1)
%p2n_cf4      probability to need cf4

%------------------------------------------------
y = (no_cf4_cntr * lab_dgr);

x = y * (cf4_li) + coup_co * (p2n_cf4) * (cf4_vu/100) +...
    x_fix;
%------------------------------------------------

if PRMS_ACLAB.drop_effect
    % --- x drops if last iteration, caregiver gave cf4 -------------
    if no_cf4_cntr == 0
        drop_factor = (cf4_li); % - phobicity
%         drop_factor = (1-cf4_li);
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

old_x = p2give_cf4_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_cf4 = get_p_thrshld_xx4(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 
                               
PRMS_C_CR.thrshld4_cf4 = thrshld4_cf4;
% -----------------------------------------------
 
% --- Probability ---------------------------------------------------
Pg = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need to care and update p ----------------------------
if Pg >= thrshld4_cf4
    need2give_cf4 = true; %caregiver needs to give cf4 and gives it
else
    need2give_cf4 = false;   
end

p2give_cf4_x = x;
p2give_cf4   = Pg;
% -------------------------------------------------------------------

agt.need2give_cf4 = need2give_cf4;
agt.p2give_cf4_x  = x;
agt.p2give_cf4    = Pg;


    
  


   


