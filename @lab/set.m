function lb=set(lb,prop_name,val)

%standard function to allow insertion of memory parameters from caregiver object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
  
case 'shape'
    lb.shape       = val;
case 'unit'
    lb.unit        = val;
case 'size'
    lb.size        = val;
case 'out_pos'
    lb.out_pos     = val;
case 'door_pos'
    lb.door_pos    = val;
case 'field'
    lb.field       = val;    
case 'empty_field'
    lb.empty_field = val;
case 'obj4cd'
    lb.obj4cd      = val;
case 'obj4cr'
    lb.obj4cr      = val;
case 'obj4cd_n'
    lb.obj4cd_n    = val;
case 'obj4cr_n'
    lb.obj4cr_n    = val;
case 'obj4cd_pos'
    lb.obj4cd_pos  = val;
case 'obj4cr_pos'
    lb.obj4cr_pos  = val;
case 'obj4cd_mex'
    lb.obj4cd_mex  = val;
case 'obj4cr_mex'
    lb.obj4cr_mex  = val;   
case 'obj4cd_xint'
    lb.obj4cd_xint = val;
case 'obj4cr_xint'
    lb.obj4cr_xint = val;     
case 'obj4cd_xc'
    lb.obj4cd_xc   = val;   
case 'obj4cr_xc'
    lb.obj4cr_xc   = val;
case 'obj4cd_xic'
    lb.obj4cd_xic  = val;   
case 'obj4cr_xic'   
    lb.obj4cr_xic  = val;   
case 'obj4cd_act'   
    lb.obj4cd_act  = val;
case 'obj4cr_act'
    lb.obj4cr_act  = val;  
case 'cd_pos'
    lb.cd_pos      = val;  
case 'cr_pos'
    lb.cr_pos      = val;
case 'cd_cr_d'
    lb.cd_cr_d     = val;
    
otherwise 
   error('invalid field name')
end

 

