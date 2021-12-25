function cd=set(cd,prop_name,val)

%standard function to allow insertion of memory parameters from child object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'pos'
    cd.pos           = val; 
case 'speed'
    cd.speed         = val; 
case 'ex_range'
    cd.ex_range      = val;
case 'iwm'
    cd.iwm           = val;
case 'need4_cf2'
    cd.need4_cf2     = val;
case 'need4_cf3'
    cd.need4_cf3     = val;
case 'need4_cf4'
    cd.need4_cf4     = val;
case 'p2need_cf2_x'
    cd.p2need_cf2_x  = val;
case 'p2need_cf3_x'
    cd.p2need_cf3_x  = val; 
case 'p2need_cf4_x'
    cd.p2need_cf4_x  = val; 
case 'p2need_cf2_xf'
    cd.p2need_cf2_xf = val;
case 'p2need_cf3_xf'
    cd.p2need_cf3_xf = val; 
case 'p2need_cf4_xf'
    cd.p2need_cf4_xf = val; 
case 'p2need_cf2'
    cd.p2need_cf2    = val;
case 'p2need_cf3'
    cd.p2need_cf3    = val;  
case 'p2need_cf4'
    cd.p2need_cf4    = val;  
case 'no_cf2_cntr'
    cd.no_cf2_cntr   = val;
case 'no_cf3_cntr'
    cd.no_cf3_cntr   = val;
case 'no_cf4_cntr'
    cd.no_cf4_cntr   = val;
case 'cf2_ed'
    cd.cf2_ed        = val;  
case 'cf3_pd'
    cd.cf3_pd        = val;
case 'cf4_vu'
    cd.cf4_vu        = val; 
case 'cf2_ed_trgt'
    cd.cf2_ed_trgt   = val;
case 'cf3_pd_trgt'
    cd.cf3_pd_trgt   = val;
case 'cf4_vu_trgt'
    cd.cf4_vu_trgt   = val;
case 'cf2_i'
    cd.cf2_i         = val;
case 'cf3_d'
    cd.cf3_d         = val; 
case 'cf4_d'
    cd.cf4_d         = val; 
case 'cf2_i_trgt'
    cd.cf2_i_trgt    = val;  
case 'cf3_d_trgt'
    cd.cf3_d_trgt    = val;
case 'cf4_d_trgt'
    cd.cf4_d_trgt    = val;   
case 'cf2_if'
    cd.cf2_if        = val;
case 'cf3_df'
    cd.cf3_df        = val;
case 'cf4_df'
    cd.cf4_df        = val;
    
otherwise 
   error('invalid field name')
end

