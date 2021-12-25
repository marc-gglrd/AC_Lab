function [agt,need4_cf3,p2need_cf3,p2need_cf3_x]=cd_get_need4_cf3(agt,lab)

%detection-function of cf3-need for class CHILD
%agt: child object
%need4_cf3: true if need for cf3, 0 otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%GLOBAL VARIABLES
%PRMS_ACLAB: aclab-program parameters
%PRMS_C_CD: CHILD-class parameters
%SIGNALS: data structure containing information that agents need to exchange
     
global  SIGNALS PRMS_ACLAB PRMS_C_CD

%NEED FOR cf3 RULE
%(1) child calculates distance to caregiver (d)
%(2) Pn probability of child needing cf3 from caregiver:
%    Pn = x / (x + ad3_am^x), where x = d * lab_dgr * p2g_cf3
%If Pn > thrshld4_ad2, child will feel need for cf3

% --- get child properties ------------------------------------------
ad3_am        = agt.iwm.ad3_am;    %get attachment dimension
p2need_cf3_x  = agt.p2need_cf3_x;  %get x of Pn
p2need_cf3_xf = agt.p2need_cf3_xf; %get fix for x of Pn
no_cf3_cntr   = agt.no_cf3_cntr;   %get number of iterations without receiving cf3
cf3_pd        = agt.cf3_pd;        %get p-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cr_ndx = find(typ==PRMS_ACLAB.type_cr); %get index of caregiver

p2g_cf3 = SIGNALS.p2give_cf3(cr_ndx);
lab_dgr = PRMS_ACLAB.lab_dgr; %lab danger
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2need_cf3_xf; 
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: (1-ad3_am)*10 ----------
p_curve = PRMS_ACLAB.p_curve_ad3_am;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%ad3_am:      ambivalence
%no_cf3_cntr: number of iterations without receiving cf3 (not cared for counter)
%cf3_pd:      cf3 physical  distance (0 to 100)
%lab_dgr:     lab danger level (as perceived by the child) (0-1)
%p2g_cf3      probability to give cf3

%------------------------------------------------
y = (no_cf3_cntr * lab_dgr);

x = y * (ad3_am) + coup_co * (p2g_cf3) * (cf3_pd/100) +...
    x_fix; 
%------------------------------------------------
 
if PRMS_ACLAB.drop_effect
    % --- x drops if last iteration, caregiver gave cf3 -------------
    if no_cf3_cntr == 0
        drop_factor = ad3_am;
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

old_x = p2need_cf3_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_ad3 = get_p_thrshld_xx3(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 

PRMS_C_CD.thrshld4_ad3 = thrshld4_ad3;
% -----------------------------------------------
                                 
% --- Probability ---------------------------------------------------
Pn = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need for care and set p ------------------------------

if Pn >= thrshld4_ad3
    need4_cf3 = true; %child needs cf3 and asks for it
else
    need4_cf3 = false;
end

p2need_cf3_x = x;
p2need_cf3   = Pn;
% -------------------------------------------------------------------

agt.need4_cf3    = need4_cf3;
agt.p2need_cf3_x = x;
agt.p2need_cf3   = Pn;
   
