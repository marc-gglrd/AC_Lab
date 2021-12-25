function cr=set(cr,prop_name,val)

%standard function to allow insertion of memory parameters from caregiver object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'pos'
    cr.pos           = val; 
case 'speed'
    cr.speed         = val; 
case 'ex_range'
    cr.ex_range      = val;
case 'iwm'
    cr.iwm           = val;
case 'need2give_cf2'
    cr.need2give_cf2 = val;
case 'need2give_cf3'
    cr.need2give_cf3 = val;
case 'need2give_cf4'
    cr.need2give_cf4 = val;
case 'p2give_cf2_x'
    cr.p2give_cf2_x  = val;    
case 'p2give_cf3_x'
    cr.p2give_cf3_x  = val; 
case 'p2give_cf4_x'
    cr.p2give_cf4_x  = val;    
case 'p2give_cf2_xf'
    cr.p2give_cf2_xf = val;    
case 'p2give_cf3_xf'
    cr.p2give_cf3_xf = val; 
case 'p2give_cf4_xf'
    cr.p2give_cf4_xf = val; 
case 'p2give_cf2'
    cr.p2give_cf2    = val;    
case 'p2give_cf3'
    cr.p2give_cf3    = val;
case 'p2give_cf4'
    cr.p2give_cf4    = val;   
case 'no_cf2_cntr'
    cr.no_cf2_cntr   = val;
case 'no_cf3_cntr'
    cr.no_cf3_cntr   = val; 
case 'no_cf4_cntr'
    cr.no_cf4_cntr   = val; 
case 'cf2_ed'
    cr.cf2_ed        = val;  
case 'cf3_pd'
    cr.cf3_pd        = val; 
case 'cf4_vu'
    cr.cf4_vu        = val; 
case 'cf2_ed_trgt'
    cr.cf2_ed_trgt   = val;
case 'cf3_pd_trgt'
    cr.cf3_pd_trgt   = val;
case 'cf4_vu_trgt'
    cr.cf4_vu_trgt   = val;
case 'cf2_i'
    cr.cf2_i         = val;
case 'cf3_d'
    cr.cf3_d         = val;   
case 'cf4_d'
    cr.cf4_d         = val;   
case 'cf2_i_trgt'
    cr.cf2_i_trgt    = val;  
case 'cf3_d_trgt'
    cr.cf3_d_trgt    = val; 
case 'cf4_d_trgt'
    cr.cf4_d_trgt    = val;  
case 'cf2_if'
    cr.cf2_if        = val;
case 'cf3_df'
    cr.cf3_df        = val;
case 'cf4_df'
    cr.cf4_df        = val;
    
otherwise 
   error('invalid field name')
end

