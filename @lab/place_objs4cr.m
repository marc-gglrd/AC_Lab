function [placed,lab]=place_objs4cr(lab)

%placing function for class LAB
%places caregiver objects in field
%lab: lab object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

size        = get(lab,'size');
obj4cr_n    = get(lab,'obj4cr_n');
field       = get(lab,'field');
empty_field = get(lab,'empty_field');
obj4cr      = get(lab,'obj4cr');

i = 1;
j = 5;
k = 2;

    for i=1:obj4cr_n
    %put n_obj4cd objects of interest for the caregiver in the lab
    %where nothing else is present
        blank_square=true;
        while blank_square==true
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
        
             if PRMS_ACLAB.c_mode == PRMS_ACLAB.c_mode_sd %%% IF STANDARD CONFIGURATION
                 if mod(i,2) == 0
                    lab_x = j;
                    lab_y = 2;
                    j = j+3;
                 else
                    lab_x = 2;
                    lab_y = k;
                    k = k+3;
                 end
                 
             elseif PRMS_ACLAB.c_mode == PRMS_ACLAB.c_mode_rm %%% IF RANDOM CONFIGURATION  
                 lab_x=randi([1,size]);
                 lab_y=randi([1,size]);
                 
             else
                 %ERROR MESSAGE
                 error('invalid mode')
             end
             
             if field(lab_x,lab_y) == empty_field &&...
                lab_x >= 1 &&...
                lab_y >= 1 &&...
                lab_x <= size &&...
                lab_y <= size
            
                 field(lab_x,lab_y)     = obj4cr;
                 lab.field(lab_x,lab_y) = obj4cr;
                 lab.obj4cr_pos(:,:,i)  = [lab_x,lab_y];
                 blank_square           = false;
                 
             end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%              
        end
    end
    
placed = true;
    %check
    %c=field;
    %z=1;




