%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- plot_stats set up plots -------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

f0_on = false; %diagram
f1_on = false; %diagram
f2_on = false; %diagram
f3_on = false; %diagram
f4_on = false; %diagram
f5_on = false; %diagram

av = num2str(PRMS_ACLAB.ad2_av);
am = num2str(PRMS_ACLAB.ad3_am);
ph = num2str(PRMS_ACLAB.ad4_ph);

if PRMS_ACLAB.out_plot == 1
    %--- activate figure 0 --------
    f0_on = true; %diagram
    title_f0_1 = 'Child-Caregiver: Lab Distance';
    title_f0_2 = 'Child-Caregiver: Mean Lab Distance';

%     f1=figure(1);
%     set(f1,'Units','Normalized');
%     set(f1,'Position',pos1);

    %--- activate figure 1 --------
    f1_on = true; %diagram (cf3)
    if cf2_plot_on
        title_f1_1 = 'Child: Indifference';
        title_f1_2 = 'Child: Mean Indifference';
        title_f1_3 = 'Caregiver: Indifference';
        title_f1_4 = 'Caregiver: Mean Indifference';
    end 
    if cf3_plot_on
        title_f1_1 = 'Child: Distancing';
        title_f1_2 = 'Child: Mean Distancing';
        title_f1_3 = 'Caregiver: Distancing';
        title_f1_4 = 'Caregiver: Mean Distancing';
    end 
    if cf4_plot_on
        title_f1_1 = 'Child: Distancing';
        title_f1_2 = 'Child: Mean Distancing';
        title_f1_3 = 'Caregiver: Distancing';
        title_f1_4 = 'Caregiver: Mean Distancing';
    end 

%     f3=figure(3);
%     set(f3,'Units','Normalized');
%     set(f3,'Position',pos3);

    %--- activate figure 2 --------
    f2_on = true; %diagram
    if cf2_plot_on
        title_f2_1 = 'Av - Child: Drive of Nr(x)';%'Child: x of P to Need cf2';
        title_f2_2 = 'Av - Caregiver: Drive of Ng(x)';%'Caregiver: x of P to Give cf2';
    end 
    if cf3_plot_on
        title_f2_1 = 'Am - Child: Drive of Nr(x)';%'Child: x of P to Need cf3';
        title_f2_2 = 'Am - Caregiver: Drive of Ng(x)';%'Caregiver: x of P to Give cf3';
    end 
    if cf4_plot_on
        title_f2_1 = 'Child: x of P to Need cf4';
        title_f2_2 = 'Caregiver: x of P to Give cf4';
    end 

%     f4=figure(4);
%     set(f4,'Units','Normalized');
%     set(f4,'Position',pos4);

    %--- activate figure 3 --------
    f3_on = true; %diagram
    if cf2_plot_on
        title_f3_1 = 'Av - Child: Nr(x)';%'Child: P to Need cf2';
        title_f3_2 = 'Av - Caregiver: Ng(x)';%'Caregiver: P to Give cf2';
    end 
    if cf3_plot_on
        title_f3_1 = 'Am - Child: Nr(x)';%'Child: P to Need cf3';
        title_f3_2 = 'Am - Caregiver: Ng(x)';%'Caregiver: P to Give cf3';
    end 
    if cf4_plot_on
        title_f3_1 = 'Child: P to Need cf4';
        title_f3_2 = 'Caregiver: P to Give cf4';
    end 

%     f5=figure(5);
%     set(f5,'Units','Normalized');
%     set(f5,'Position',pos5);

    %--- activate figure 4 --------
    f4_on = true; %diagram
    if cf2_plot_on
        title_f4_1 = strcat(av,'Av - Iterations with no care');%'Iterations with no cf2';
        title_f4_2 = 'Mean - Iterations with no care';
    end 
    if cf3_plot_on
        title_f4_1 = strcat(av,'Am - Iterations with no care');%'Iterations with no cf3';
        title_f4_2 = 'Mean - Iterations with no care';
    end 
    if cf4_plot_on
        title_f4_1 = 'Iterations with no cf4';
        title_f4_2 = 'Mean - Iterations with no cf4';
    end 

%     f6=figure(6);
%     set(f6,'Units','Normalized');
%     set(f6,'Position',pos6);

    %--- activate figure 5 --------
    f5_on = true; %diagram
    if cf2_plot_on
        title_f5_1 = 'Child: e-distance';%'Child: e-distance cf2';
        title_f5_2 = 'Child: Mean e-distance';
        title_f5_3 = 'Caregiver: e-distance';%'Caregiver: e-distance cf2';
        title_f5_4 = 'Caregiver: Mean e-distance';
    end 
    if cf3_plot_on
        title_f5_1 = 'Child: p-distance';%'Child: p-distance cf3';
        title_f5_2 = 'Child: Mean p-distance';
        title_f5_3 = 'Caregiver: p-distance';%'Caregiver: p-distance cf3';
        title_f5_4 = 'Caregiver: Mean e-distance';
    end 
    if cf4_plot_on
        title_f5_1 = 'Child: vulnerability cf4';
        title_f5_2 = 'Child: Mean vulnerability cf4';
        title_f5_3 = 'Caregiver: vulnerability cf4';
        title_f5_4 = 'Caregiver: Mean vulnerability cf4';
    end 

%     f7=figure(7);
%     set(f7,'Units','Normalized');
%     set(f7,'Position',pos7);

    %------------------------------
    
end
    
   