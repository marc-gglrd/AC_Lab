function val=get(wm,prop_name)

%standard function to allow extraction of memory parameters from iwm object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'ad2_av'
    val = wm.ad2_av;
case 'ad3_am'
    val = wm.ad3_am;  
case 'ad4_ph'
    val = wm.ad4_ph;  
case 'thrshld4_ad2'
    val = wm.thrshld4_ad2;
case 'thrshld4_ad3'
    val = wm.thrshld4_ad3;  
case 'thrshld4_ad4'
    val = wm.thrshld4_ad4;
case 'cf2_in'
    val = wm.cf2_in;  
case 'cf3_un'
    val = wm.cf3_un;  
case 'cf4_li'
    val = wm.cf4_li;  
case 'thrshld4_cf2'
    val = wm.thrshld4_cf2;
case 'thrshld4_cf3'
    val = wm.thrshld4_cf3;
case 'thrshld4_cf4'
    val = wm.thrshld4_cf4;
    
otherwise 
   error('invalid field name')
end