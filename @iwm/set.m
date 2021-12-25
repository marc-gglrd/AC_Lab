function wm=set(wm,prop_name,val)

%standard function to allow insertion of memory parameters from iwm object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'ad2_av'
    wm.ad2_av       = val;
case 'ad3_am'
    wm.ad3_am       = val;
case 'ad4_ph'
    wm.ad4_ph       = val;
case 'thrshld4_ad2'
    wm.thrshld4_ad2 = val;
case 'thrshld4_ad3'
    wm.thrshld4_ad3 = val; 
case 'thrshld4_ad4'
    wm.thrshld4_ad4 = val;
case 'cf2_in'
    wm.cf2_in       = val;
case 'cf3_un'
    wm.cf3_un       = val;
case 'cf4_li'
    wm.cf4_li       = val;
case 'thrshld4_cf2'
    wm.thrshld4_cf2 = val;
case 'thrshld4_cf3'
    wm.thrshld4_cf3 = val; 
case 'thrshld4_cf4'
    wm.thrshld4_cf4 = val; 
      
otherwise 
   error('invalid field name')
end

