function val=get(cd,prop_name)

%standard function to allow extraction of memory parameters from child object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'pos'
    val = cd.pos;
case 'speed'
    val = cd.speed;
case 'ex_range'
    val = cd.ex_range;
case 'iwm'
    val = cd.iwm;
case 'need4_cf2'
    val = cd.need4_cf2;
case 'need4_cf3'
    val = cd.need4_cf3;   
case 'need4_cf4'
    val = cd.need4_cf4;   
case 'p2need_cf2_x'
    val = cd.p2need_cf2_x;
case 'p2need_cf3_x'
    val = cd.p2need_cf3_x;
case 'p2need_cf4_x'
    val = cd.p2need_cf4_x;
case 'p2need_cf2_xf'
    val = cd.p2need_cf2_xf;
case 'p2need_cf3_xf'
    val = cd.p2need_cf3_xf; 
case 'p2need_cf4_xf'
    val = cd.p2need_cf4_xf;   
case 'p2need_cf2'
    val = cd.p2need_cf2;
case 'p2need_cf3'
    val = cd.p2need_cf3;
case 'p2need_cf4'
    val = cd.p2need_cf4;
case 'no_cf2_cntr'
    val = cd.no_cf2_cntr;  
case 'no_cf3_cntr'
    val = cd.no_cf3_cntr;
case 'no_cf4_cntr'
    val = cd.no_cf4_cntr;
case 'cf2_ed'
    val = cd.cf2_ed;  
case 'cf3_pd'
    val = cd.cf3_pd;    
case 'cf4_vu'
    val = cd.cf4_vu;    
case 'cf2_ed_trgt'
    val = cd.cf2_ed_trgt;  
case 'cf3_pd_trgt'
    val = cd.cf3_pd_trgt;  
case 'cf4_vu_trgt'
    val = cd.cf4_vu_trgt;  
case 'cf2_i'
    val = cd.cf2_i;  
case 'cf3_d'
    val = cd.cf3_d;    
case 'cf4_d'
    val = cd.cf4_d;    
case 'cf2_i_trgt'
    val = cd.cf2_i_trgt;  
case 'cf3_d_trgt'
    val = cd.cf3_d_trgt;    
case 'cf4_d_trgt'
    val = cd.cf4_d_trgt;    
case 'cf2_if'
    val = cd.cf2_if;  
case 'cf3_df'
    val = cd.cf3_df;  
case 'cf4_df'
    val = cd.cf4_df;  
    
otherwise 
   error('invalid field name')
end