function [agt,need4_cf2,p2need_cf2,p2need_cf2_x]=cd_get_need4_cf2(agt,lab)

%detection-function of cf2-need for class CHILD
%agt: child object
%need4_cf2: true if need for cf2, 0 otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%GLOBAL VARIABLES
%PRMS_ACLAB: aclab-program parameters
%PRMS_C_CD: CHILD-class parameters
%SIGNALS: data structure containing information that agents need to exchange
     
global  SIGNALS PRMS_ACLAB PRMS_C_CD

%NEED FOR cf2 RULE
%(1) child calculates distance to caregiver (d)
%(2) Pn probability of child needing cf2 from caregiver:
%    Pn = x / (x + ad2_av^x), where x = d * lab_dgr * p2g_cf2
%If Pn > thrshld4_ad2, child will feel need for cf2

% --- get child properties ------------------------------------------
ad2_av        = agt.iwm.ad2_av;    %get attachment dimension
p2need_cf2_x  = agt.p2need_cf2_x;  %get x of Pn
p2need_cf2_xf = agt.p2need_cf2_xf; %get fix for x of Pn
no_cf2_cntr   = agt.no_cf2_cntr;   %get number of iterations without receiving cf2
cf2_ed        = agt.cf2_ed;        %get e-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cr_ndx = find(typ==PRMS_ACLAB.type_cr); %get index of caregiver

p2g_cf2 = SIGNALS.p2give_cf2(cr_ndx);
lab_lns = PRMS_ACLAB.lab_lns; %lab loneliness
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2need_cf2_xf;   
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: ad2_av * 10 ------------
p_curve = PRMS_ACLAB.p_curve_ad2_av;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%ad2_av:      avoidance
%no_cf2_cntr: number of iterations without receiving cf2 (not cared for counter)
%cf2_ed:      cf2 emotional distance (0 to 100)
%lab_lns:     lab loneliness level (as perceived by the child) (0-1)
%p2g_cf2      probability to give cf2

%------------------------------------------------
y = (no_cf2_cntr * lab_lns);
 
x = (y) * (1-ad2_av) + coup_co * (1-p2g_cf2) * (cf2_ed/100) +...
    x_fix; 
%------------------------------------------------
 
if PRMS_ACLAB.drop_effect
    % --- Pn drops if last iteration, caregiver gave cf2 ------------
    if no_cf2_cntr == 0
        drop_factor = (1-ad2_av);
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
  
old_x = p2need_cf2_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_ad2 = get_p_thrshld_xx2(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 
                               
PRMS_C_CD.thrshld4_ad2 = thrshld4_ad2;
% -----------------------------------------------

% --- Probability ---------------------------------------------------
Pn = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need for care and set p ------------------------------
if Pn >= thrshld4_ad2
    need4_cf2 = true; %child needs cf2 and asks for it
else
    need4_cf2 = false;
end

p2need_cf2_x = x;
p2need_cf2   = Pn;
% -------------------------------------------------------------------

agt.need4_cf2    = need4_cf2;
agt.p2need_cf2_x = x;
agt.p2need_cf2   = Pn;
    
   
