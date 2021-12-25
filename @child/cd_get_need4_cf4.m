function [agt,need4_cf4,p2need_cf4,p2need_cf4_x]=cd_get_need4_cf4(agt,lab)

%detection-function of cf4-need for class CHILD
%agt: child object
%need4_cf4: true if need for cf4, 0 otherwise
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%GLOBAL VARIABLES
%PRMS_ACLAB: aclab-program parameters
%PRMS_C_CD: CHILD-class parameters
%SIGNALS: data structure containing information that agents need to exchange
     
global  SIGNALS PRMS_ACLAB PRMS_C_CD

%NEED FOR cf4 RULE
%(1) child calculates distance to caregiver (d)
%(2) Pn probability of child needing cf4 from caregiver:
%    Pn = x / (x + ad4_ph^x), where x = d * lab_dgr * p2g_cf4
%If Pn > thrshld4_ad2, child will feel need for cf4

% --- get child properties ------------------------------------------
ad4_ph        = agt.iwm.ad4_ph;    %get attachment dimension
p2need_cf4_x  = agt.p2need_cf4_x;  %get x of Pn
p2need_cf4_xf = agt.p2need_cf4_xf; %get fix for x of Pn
no_cf4_cntr   = agt.no_cf4_cntr;   %get number of iterations without receiving cf4
cf4_vu        = agt.cf4_vu;        %get p-distance
% -------------------------------------------------------------------

% --- variables to calculate x --------------------------------------
typ    = SIGNALS.atype;                 %get types of all agents
cr_ndx = find(typ==PRMS_ACLAB.type_cr); %get index of caregiver

p2g_cf4 = SIGNALS.p2give_cf4(cr_ndx);
lab_dgr = PRMS_ACLAB.lab_dgr; %lab danger
coup_co = PRMS_ACLAB.coup_co; %coupling coefficient
x_fix   = p2need_cf4_xf; 
d       = lab.cd_cr_d; %child-caregiver distance
% -------------------------------------------------------------------

% --- REFERENCE P-CURVE: (1-ad4_ph)*10 ----------
p_curve = PRMS_ACLAB.p_curve_ad4_ph;
% -----------------------------------------------

% --- calculate x ---------------------------------------------------
%ad4_ph:      phobicity
%no_cf4_cntr: number of iterations without receiving cf4 (not cared for counter)
%cf4_vu:      cf4 vulnerability (0 to 100)
%lab_dgr:     lab danger level (as perceived by the child) (0-1)
%p2g_cf4      probability to give cf4

%------------------------------------------------
y = (no_cf4_cntr * lab_dgr);

x = y * (ad4_ph) + coup_co * (p2g_cf4) * (cf4_vu/100) +...
    x_fix;
%------------------------------------------------

if PRMS_ACLAB.drop_effect
    % --- x drops if last iteration, caregiver gave cf4 -------------
    if no_cf4_cntr == 0
        drop_factor = ad4_ph;
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

old_x = p2need_cf4_x;

% -----------------------------------------------

% --- threshold ---------------------------------
thrshld4_ad4 = get_p_thrshld_xx4(p_curve,...
                                 agt.iwm,...
                                 max_x,...
                                 x_bl,...
                                 x,...
                                 old_x); 

PRMS_C_CD.thrshld4_ad4 = thrshld4_ad4;
% -----------------------------------------------
                                 
% --- Probability ---------------------------------------------------
Pn = get_p(agt.iwm,p_curve,x);
% -------------------------------------------------------------------

% --- check if need for care and set p ------------------------------

if Pn >= thrshld4_ad4
    need4_cf4 = true; %child needs cf4 and asks for it
else
    need4_cf4 = false;
end

p2need_cf4_x = x;
p2need_cf4   = Pn;
% -------------------------------------------------------------------

agt.need4_cf4    = need4_cf4;
agt.p2need_cf4_x = x;
agt.p2need_cf4   = Pn;
   
