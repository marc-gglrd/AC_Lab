function val=get(cr,prop_name)

%standard function to allow extraction of memory parameters from caregiver object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'pos'
    val = cr.pos;
case 'speed'
    val = cr.speed;
case 'ex_range'
    val = cr.ex_range;
case 'iwm'
    val = cr.iwm;
case 'need2give_cf2'
    val = cr.need2give_cf2;
case 'need2give_cf3'
    val = cr.need2give_cf3;  
case 'need2give_cf4'
    val = cr.need2give_cf4;  
case 'p2give_cf2_x'
    val = cr.p2give_cf2_x;    
case 'p2give_cf3_x'
    val = cr.p2give_cf3_x; 
case 'p2give_cf4_x'
    val = cr.p2give_cf4_x; 
case 'p2give_cf2_xf'
    val = cr.p2give_cf2_xf;    
case 'p2give_cf3_xf'
    val = cr.p2give_cf3_xf;
case 'p2give_cf4_xf'
    val = cr.p2give_cf4_xf;
case 'p2give_cf2'
    val = cr.p2give_cf2;    
case 'p2give_cf3'
    val = cr.p2give_cf3;  
case 'p2give_cf4'
    val = cr.p2give_cf4;    
case 'no_cf2_cntr'
    val = cr.no_cf2_cntr;  
case 'no_cf3_cntr'
    val = cr.no_cf3_cntr;
case 'no_cf4_cntr'
    val = cr.no_cf4_cntr;
case 'cf2_ed'
    val = cr.cf2_ed;  
case 'cf3_pd'
    val = cr.cf3_pd;
case 'cf4_vu'
    val = cr.cf4_vu;  
case 'cf2_ed_trgt'
    val = cr.cf2_ed_trgt;  
case 'cf3_pd_trgt'
    val = cr.cf3_pd_trgt;
case 'cf4_vu_trgt'
    val = cr.cf4_vu_trgt;  
case 'cf2_i'
    val = cr.cf2_i;  
case 'cf3_d'
    val = cr.cf3_d;
case 'cf4_d'
    val = cr.cf4_d;  
case 'cf2_i_trgt'
    val = cr.cf2_i_trgt;  
case 'cf3_d_trgt'
    val = cr.cf3_d_trgt;
case 'cf4_d_trgt'
    val = cr.cf4_d_trgt;  
case 'cf2_if'
    val = cr.cf2_if;  
case 'cf3_df'
    val = cr.cf3_df;
case 'cf4_df'
    val = cr.cf4_df;  
    
otherwise 
   error('invalid field name')
end



