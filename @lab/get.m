function val=get(lb,prop_name)

%standard function to allow extraction of memory parameters from caregiver object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

switch prop_name
   
case 'shape'
    val = lb.shape;
case 'unit'
    val = lb.unit;
case 'size'
    val = lb.size;
case 'out_pos'
    val = lb.out_pos;
case 'door_pos'
    val = lb.door_pos;
case 'field'
    val = lb.field;     
case 'empty_field'
    val = lb.empty_field;
case 'obj4cd'
    val = lb.obj4cd;
case 'obj4cr'
    val = lb.obj4cr;    
case 'obj4cd_n'
    val = lb.obj4cd_n;
case 'obj4cr_n'
    val = lb.obj4cr_n;
case 'obj4cd_pos'
    val = lb.obj4cd_pos;
case 'obj4cr_pos'
    val = lb.obj4cr_pos; 
case 'obj4cd_mex'
    val = lb.obj4cd_mex;
case 'obj4cr_mex'
    val = lb.obj4cr_mex;   
case 'obj4cd_xint'
    val = lb.obj4cd_xint;
case 'obj4cr_xint'
    val = lb.obj4cr_xint; 
case 'obj4cd_xc'
    val = lb.obj4cd_xc;
case 'obj4cr_xc'
    val = lb.obj4cr_xc;    
case 'obj4cd_xic'
    val = lb.obj4cd_xic;
case 'obj4cr_xic'
    val = lb.obj4cr_xic;   
case 'obj4cd_act'
    val = lb.obj4cd_act;
case 'obj4cr_act'
    val = lb.obj4cr_act;  
case 'cd_pos'
    val = lb.cd_pos;  
case 'cr_pos'
    val = lb.cr_pos;
case 'cd_cr_d'
    val = lb.cd_cr_d;
    
otherwise 
   error('invalid field name')
end


       
        
        
       
       
       

                            
                            
                    
                    
                  



