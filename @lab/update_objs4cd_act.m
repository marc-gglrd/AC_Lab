function [lab] = update_objs4cd_act(lab,ndx_xplrd)

%Objct-for-child-activation update function for class LAB
%Updates activation according to iteration gone by and
%child current interest in object at index ndx_xplrd if any
%lab: lab object
%ndx_xplrd: index of objs4cd the child is currently inerested in
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%ACTIVATION RULE
%If an obj4cd is being explored this iteration:
% - its obj4cd_xc goes down by 1
% - if its obj4cd_xc becomes zero, it becomes inactive 
%If an obj4cd is not being explored this iteration:
% - its obj4cd_ic goes down by 1
% - if its obj4cd_xc becomes zero and its obj4cd_xc is greater than zero, it becomes active 
%An obj4cd is active when its activation is

obj4cd_n    = get(lab,'obj4cd_n');
obj4cd_mex  = get(lab,'obj4cd_mex');
obj4cd_xint = get(lab,'obj4cd_xint');
obj4cd_xc   = get(lab,'obj4cd_xc');   
obj4cd_xic  = get(lab,'obj4cd_xic');       
obj4cd_act  = get(lab,'obj4cd_act');

for i=1:obj4cd_n
    
    if i == ndx_xplrd
    %this iteration, the obj4cd is being explored  
        
        obj4cd_xc(i) = obj4cd_xc(i) - 1; %child will explore this obj4cd for 1 iteration less at most
                                         %before taking an exploration break (of obj4cd_xint intervals) for this obj4cd
        
        if obj4cd_xc(i) == 0 
        %next iteration, obj4cd will be uninteresting to child
        %this iteration, interest in this obj4cd ends (next iteration, child will have no interest)   
            
            obj4cd_xc(i)  = obj4cd_mex;  %child may explore this obj4cd for obj4cd_mex iterations after obj4cd_xint iterations
            obj4cd_xic(i) = obj4cd_xint; %child will not explore this obj4cd before obj4cd_xint iterations
            obj4cd_act(i) = false;       %next iteration, obj4cd will be inactive (uninteresting to child)
            
        %else
        %next iteration, obj4cd will still be interesting to child
        
            %obj4cd_xc(i)  = obj4cd_xc(i); %child may explore this obj4cd for obj4cd_xc(i) iterations from next iteration
            %obj4cd_xic(i) = 0;            %child may explore this obj4cd next iteration
            %obj4cd_act(i) = true;         %next iteration, obj4cd will be active (interesting to child)
            
        end
            
    else
    %this iteration, the obj4cd is not being explored
        
        %obj4cd_xc(i)  = obj4cd_xc(i);       %child may explore this obj4cd for obj4cd_xc(i) iterations from next iteration
        if obj4cd_xic(i) > 0
            obj4cd_xic(i) = obj4cd_xic(i) - 1;  %child may start exploring this obj4cd in 1 less iteration
        end
        
        if obj4cd_xic(i) == 0 && obj4cd_xc(i) > 0
            obj4cd_act(i) = true;   %obj4cd is active (interesting to child)
        else
            obj4cd_act(i) = false;  %obj4cd is inactive (not interesting to child)
        end
         
    end
    
end

lab.obj4cd_xc  = obj4cd_xc;
lab.obj4cd_xic = obj4cd_xic;       
lab.obj4cd_act = obj4cd_act;

    %check
    %b=field;
    %z=1;



