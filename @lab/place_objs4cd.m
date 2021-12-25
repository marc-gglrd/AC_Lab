function [placed,lab]=place_objs4cd(lab)

%placing function for class LAB
%places child objects in field
%lab: lab object
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global PRMS_ACLAB

size        = get(lab,'size');
obj4cd_n    = get(lab,'obj4cd_n');
field       = get(lab,'field');
empty_field = get(lab,'empty_field');
obj4cd      = get(lab,'obj4cd');

i = 1;
j = size - 4;
k = size - 1;

    for i=1:obj4cd_n 
    %put n_obj4cd objects of interest for the child in the lab
    %where nothing else is present
        blank_square=true;
        while blank_square==true
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
        
             if PRMS_ACLAB.c_mode == PRMS_ACLAB.c_mode_sd %%% IF STANDARD CONFIGURATION
                 if mod(i,2) == 0
                     lab_x = j-1;
                     lab_y = size - 2;
                     j = j-3;
                 else
                     lab_x = size - 2;
                     lab_y = k-1;
                     k = k-3;
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
            
                 field(lab_x,lab_y)     = obj4cd;
                 lab.field(lab_x,lab_y) = obj4cd;
                 lab.obj4cd_pos(:,:,i)  = [lab_x,lab_y];
                 blank_square           = false;
                 
             end
             
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
        end
    end
     
placed = true;
    %check
    %b=field;
    %z=1;



