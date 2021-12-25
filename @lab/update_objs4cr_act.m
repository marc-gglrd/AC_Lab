function [lab] = update_objs4cr_act(lab,ndx_xplrd)

%Objct-for-caregiver-activation update function for class LAB
%Updates activation according to iteration gone by and
%caregiver current interest in object at index ndx_xplrd if any
%lab: lab object
%ndx_xplrd: index of objs4cr the caregiver is currently inerested in
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

%ACTIVATION RULE
%If an obj4cr is being explored this iteration:
% - its obj4cr_xc goes down by 1
% - if its obj4cr_xc becomes zero, it becomes inactive 
%If an obj4cr is not being explored this iteration:
% - its obj4cr_ic goes down by 1
% - if its obj4cr_xc becomes zero and its obj4cr_xc is greater than zero, it becomes active 
%An obj4cr is active when its activation is

obj4cr_n    = get(lab,'obj4cr_n');
obj4cr_mex  = get(lab,'obj4cr_mex');
obj4cr_xint = get(lab,'obj4cr_xint');
obj4cr_xc   = get(lab,'obj4cr_xc');   
obj4cr_xic  = get(lab,'obj4cr_xic');       
obj4cr_act  = get(lab,'obj4cr_act');

for i=1:obj4cr_n
    
    if i == ndx_xplrd
    %this iteration, the obj4cr is being explored  
        
        obj4cr_xc(i) = obj4cr_xc(i) - 1; %caregiver will explore this obj4cr for 1 iteration less at most
                                         %before taking an exploration break (of obj4cr_xint intervals) for this obj4cr
        
        if obj4cr_xc(i) == 0 
        %next iteration, obj4cr will be uninteresting to caregiver
        %this iteration, interest in this obj4cr ends (next iteration, caregiver will have no interest)   
            
            obj4cr_xc(i)  = obj4cr_mex;  %caregiver may explore this obj4cr for obj4cr_mex iterations after obj4cr_xint iterations
            obj4cr_xic(i) = obj4cr_xint; %caregiver will not explore this obj4cr before obj4cr_xint iterations
            obj4cr_act(i) = false;       %next iteration, obj4cr will be inactive (uninteresting to caregiver)
            
        %else
        %next iteration, obj4cr will still be interesting to caregiver
        
            %obj4cr_xc(i)  = obj4cr_xc(i); %caregiver may explore this obj4cr for obj4cr_xc(i) iterations from next iteration
            %obj4cr_xic(i) = 0;            %caregiver may explore this obj4cr next iteration
            %obj4cr_act(i) = true;         %next iteration, obj4cr will be active (interesting to caregiver)
            
        end
            
    else
    %this iteration, the obj4cr is not being explored
        
        %obj4cr_xc(i)  = obj4cr_xc(i);       %caregiver may explore this obj4cr for obj4cr_xc(i) iterations from next iteration
        if obj4cr_xic(i) > 0
            obj4cr_xic(i) = obj4cr_xic(i) - 1;  %caregiver may start exploring this obj4cr in 1 less iteration
        end
        
        if obj4cr_xic(i) == 0 && obj4cr_xc(i) > 0
            obj4cr_act(i) = true;   %obj4cr is active (interesting to caregiver)
        else
            obj4cr_act(i) = false;  %obj4cr is inactive (not interesting to caregiver)
        end
         
    end
    
end

lab.obj4cr_xc  = obj4cr_xc;
lab.obj4cr_xic = obj4cr_xic;       
lab.obj4cr_act = obj4cr_act;

    %check
    %b=field;
    %z=1;

