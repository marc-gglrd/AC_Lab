function plot_stats(agt_ctnr,lab_ctnr,strt_cnfg)

%Prints stats on screen and plot diagrams
%Plots 2d patch images of agents onto background:
% - child:     black dot/star
% - caregiver: white dot/star
% - object for child:     black square
% - object for caregiver: white square
% + Lab Distance
% + Trajectories        (CD&CR) (last 200 iterations)
% + Relative Trajectory (CD-CR) (last 200 iterations)
%agt_ctnr: agent container (cell array)
%lab_ctnr: lab container   (cell array)
%strt_cnfg: flag indicating starting configuration (iteration zero) when true
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

global N_IT IT_STATS PRMS_ACLAB SIGNALS
    
%N_IT: current iteration number
%PRMS_ACLAB: data structure containing aclab-program parameters
%IT_STATS:   data structure containing statistics on model at each iteration
%SIGNALS:    data structure containing info that agents need to exchange

pv = PRMS_ACLAB.pv;

ad_cf = PRMS_ACLAB.ad_cf;
ac_lab_size = PRMS_ACLAB.size;
ac_lab_maxd = PRMS_ACLAB.maxd;%lab diagonal (max lab distance)

cf2_on = PRMS_ACLAB.cf2_on;
cf3_on = PRMS_ACLAB.cf3_on;
cf4_on = PRMS_ACLAB.cf4_on;
report_only = PRMS_ACLAB.report_only;
f_path = PRMS_ACLAB.plot_path;

tot_cd        = IT_STATS.tot_cd;        %(1)
tot_cr        = IT_STATS.tot_cr;        %(2)
tot           = IT_STATS.tot;           %(3)
pos_cd        = IT_STATS.pos_cd;        %(4)
pos_cr        = IT_STATS.pos_cr;        %(5)

%- child coordinate variables ---------
pos_cd_x =     IT_STATS.pos_cd_x;
pos_cd_y =     IT_STATS.pos_cd_y;
pos_cd_x_pre = IT_STATS.pos_cd_x_pre;
pos_cd_y_pre = IT_STATS.pos_cd_y_pre;
pos_cd_x_d =   pos_cd_x - pos_cd_x_pre;
pos_cd_y_d =   pos_cd_y - pos_cd_y_pre;
%--------------------------------------

%- caregiver coordinate variables -----
pos_cr_x =     IT_STATS.pos_cr_x;
pos_cr_y =     IT_STATS.pos_cr_y;
pos_cr_x_pre = IT_STATS.pos_cr_x_pre;
pos_cr_y_pre = IT_STATS.pos_cr_y_pre;
pos_cr_x_d =   pos_cr_x - pos_cr_x_pre;
pos_cr_y_d =   pos_cr_y - pos_cr_y_pre;
%--------------------------------------

pos_cd_cr_x_d = pos_cd_x - pos_cr_x;
pos_cd_cr_y_d = pos_cd_y - pos_cr_y;

%--------------------------------------

plot_stats_var_cf2 %declare variables for avoidance   (cf2) (m-file)
plot_stats_var_cf3 %declare variables for ambivalence (cf3) (m-file)
plot_stats_var_cf4 %declare variables for phobicity   (cf4) (m-file)

% --- lab distance ------------------------------

d_cd_cr       = IT_STATS.d_cd_cr;     %(22)
d_cd_cr_2     = IT_STATS.d_cd_cr_2;   %(22b)
 
d_cd_cr_s    = IT_STATS.d_cd_cr_s;    %(63) 
d_cd_cr_m    = IT_STATS.d_cd_cr_m;    %(64) 
d_cd_cr_dm2s = IT_STATS.d_cd_cr_dm2s; %(65) 
d_cd_cr_sd   = IT_STATS.d_cd_cr_sd;   %(66)
 
% --- explore/approach --------------------------

cd_explore  = IT_STATS.cd_explore;              %(151)
cd_approach = IT_STATS.cd_approach;             %(152)
cr_explore  = IT_STATS.cr_explore;              %(153)
cr_approach = IT_STATS.cr_approach;             %(154)
 
cd_explore_cntr  = IT_STATS.cd_explore_cntr;    %(155)
cd_approach_cntr = IT_STATS.cd_approach_cntr;   %(156)    
cr_explore_cntr  = IT_STATS.cr_explore_cntr;    %(157)
cr_approach_cntr = IT_STATS.cr_approach_cntr;   %(158)

cd_explore_pc    = IT_STATS.cd_explore_pc;      %(163)
cd_approach_pc   = IT_STATS.cd_approach_pc;     %(164)    
cr_explore_pc    = IT_STATS.cr_explore_pc;      %(165)
cr_approach_pc   = IT_STATS.cr_approach_pc;     %(166)

% -----------------------------------------------
 
tot_it   = PRMS_ACLAB.tot_it;
out_intr = PRMS_ACLAB.out_intr;
out_strt = PRMS_ACLAB.out_strt;
out_end  = PRMS_ACLAB.out_end;
out_imgs = PRMS_ACLAB.out_imgs;


if strt_cnfg %N_IT == 1
    n_it = N_IT;
else %N_IT >= 2
    n_it = N_IT+1;
end    
    
%since plotting takes time,
%we can chose to plot
% - every out_intr iterations
% - from iteration out_strt to out_end 
   
if strt_cnfg                     || ... %first iteration ||
   (N_IT == tot_it)              || ... %last  iteration ||
   (rem(n_it-1 , out_intr) == 0)        %out_intr iteration
   
    % ---------------------------------------------------------------
    if ~report_only %print iteration log on screen
    % ---------------------------------------------------------------
    % ---------------------------------------------------------------
    % --- write results on the screen -------------------------------
    % ---------------------------------------------------------------
    if strt_cnfg                                || ... %first iteration ||
       (N_IT == tot_it)                         || ... %last  iteration ||
      ((N_IT >= out_strt) && (N_IT <= out_end))        %iteration from out_strt to out_end
    % ---------------------------------------------------------------
    
    if strt_cnfg
        disp(strcat('---------------------------------------------------'))
        disp(['--- ', pv, ' ---------------------------'])
        disp(strcat('---------------------------------------------------'))
    end

    disp(strcat('---------------------------------------------------'))
    disp(strcat('(00) ITERATION -',          num2str                 (n_it-1),'-'))   
    disp(strcat('(01) No. children   = ',    num2str(round(tot_cd    (n_it),4))))
    disp(strcat('(02) No. caregivers = ',    num2str(round(tot_cr    (n_it),4))))
    disp(strcat('(03) No. agents     = ',    num2str(round(tot       (n_it),4))))
    disp(strcat('(04) CD position = ',       num2str(round(pos_cd(:,:,n_it),4))))
    disp(strcat('(05) CR position = ',       num2str(round(pos_cr(:,:,n_it),4))))
    disp(strcat('(06) Lab Distance CD-CR = ',num2str(round(d_cd_cr   (n_it),4)),...
                '   m = ',                   num2str(round(d_cd_cr_m (n_it),4)),...
                '   sd = ',                  num2str(round(d_cd_cr_sd(n_it),4))))
    
    if cf2_on
        plot_stats_print_cf2 %print on screen for avoidance   (cf2) (m-file)
    end
    
    if cf3_on
        plot_stats_print_cf3 %print on screen for ambivalence (cf3) (m-file)
    end
    
    if cf4_on
        plot_stats_print_cf4 %print on screen for phobicity   (cf4) (m-file)
    end
 
    %disp(strcat('---   ---   ---   ---   ---   ---   ---   ---   ---'))
    
    disp(strcat('(40) CD Exploring   = ',num2str(cd_explore (n_it))))
    disp(strcat('(41) CD Approaching = ',num2str(cd_approach(n_it))))
    disp(strcat('(42) CR Exploring   = ',num2str(cr_explore (n_it))))
    disp(strcat('(43) CR Approaching = ',num2str(cr_approach(n_it))))
    
    disp(strcat('---   ---   ---   ---   ---   ---   ---   ---   ---'))
    
    disp(strcat('(44) Tot. CD Exploring   = ',num2str(cd_explore_cntr     (n_it)),...
                '   (',                       num2str(round(cd_explore_pc (n_it),2)),'%)'))
    disp(strcat('(45) Tot. CD Approaching = ',num2str(cd_approach_cntr    (n_it)),...
                '   (',                       num2str(round(cd_approach_pc(n_it),2)),'%)'))
    disp(strcat('(46) Tot. CR Exploring   = ',num2str(cr_explore_cntr     (n_it)),...
                '   (',                       num2str(round(cr_explore_pc (n_it),2)),'%)'))
    disp(strcat('(47) Tot. CR Approaching = ',num2str(cr_approach_cntr    (n_it)),...
                '   (',                       num2str(round(cr_approach_pc(n_it),2)),'%)'))   
   
    disp(strcat('---------------------------------------------------'))
    
    % ---------------------------------------------------------------
    % ---- print what is being processed ----------------------------
    % ---------------------------------------------------------------
    if strt_cnfg    
        if cf2_on
            disp(strcat('[...] Avoidance        (ad2) [- ON -] = ',num2str(round(ad2_av(n_it),4)))) 
            disp(strcat('[...] Insensitivity    (cf2) [- ON -] = ',num2str(round(cf2_in(n_it),4))))
        end
        disp(strcat('---------------------------------------------------'))

        if cf3_on
            disp(strcat('[...] Ambivalence      (ad3) [- ON -] = ',num2str(round(ad3_am(n_it),4)))) 
            disp(strcat('[...] Unresponsiveness (cf3) [- ON -] = ',num2str(round(cf3_un(n_it),4))))
        end
        disp(strcat('---------------------------------------------------'))

        if cf4_on
            disp(strcat('[...] Phobicity  (ad4) [- ON -] = ',      num2str(round(ad4_ph(n_it),4)))) 
            disp(strcat('[...] Limitation (cf4) [- ON -] = ',      num2str(round(cf4_li(n_it),4))))
        end
        disp(strcat('---------------------------------------------------'))
    end   
    % ---------------------------------------------------------------
    
    % ---------------------------------------------------------------
    end %write results on the screen
    % ---------------------------------------------------------------
    % ---------------------------------------------------------------
    end %iteration log
    % ---------------------------------------------------------------
    
    if (N_IT == tot_it) %last iteration
        
        disp(['---------------------------------------------------'])
        disp(['--- FINAL REPORT --- ', pv, ' ----------'])
        disp(['---------------------------------------------------'])
        
        disp(['[-- 00 --] ITERATIONS -',               num2str(n_it-1),'-'])
        
        PRMS_ACLAB.final_report_out(1,2)    =                n_it-1;  
        
        disp(['[-- 01 --] Lab Distance CD-CR: m = ' num2str(round(d_cd_cr_m(n_it),4))])  
        
        PRMS_ACLAB.final_report_out(2,2)    =             round(d_cd_cr_m(n_it),4);
        
        disp(['---------------------------------------------------'])
        
        if cf2_on
            plot_stats_print_last_cf2 %print last on screen for avoidance   (cf2) (m-file)
        end
    
        if cf3_on
            plot_stats_print_last_cf3 %print last on screen for ambivalence (cf3) (m-file)
        end
    
        if cf4_on
            plot_stats_print_last_cf4 %print last on screen for phobicity   (cf4) (m-file)
        end
        
        disp(['---------------------------------------------------'])
        
        disp(['[-- 15 --] CD Exploring   (% it.s) ' num2str(round(cd_explore_pc (n_it),2)) '%' ...
              '   ('                                  num2str(cd_explore_cntr     (n_it)) ')'])
          
        PRMS_ACLAB.final_report_out(29,2) =                   round(cd_explore_pc (n_it),2); 
        PRMS_ACLAB.final_report_out(30,2) =                   cd_explore_cntr     (n_it); 
        
        disp(['[-- 16 --] CD Approaching (% it.s) ' num2str(round(cd_approach_pc(n_it),2)) '%' ...
              '   ('                                  num2str(cd_approach_cntr    (n_it)) ')'])
          
        PRMS_ACLAB.final_report_out(31,2) =                   round(cd_approach_pc(n_it),2); 
        PRMS_ACLAB.final_report_out(32,2) =                   cd_approach_cntr    (n_it); 
        
        disp(['[-- 17 --] CR Exploring   (% it.s) ' num2str(round(cr_explore_pc (n_it),2)) '%' ...
              '   ('                                  num2str(cr_explore_cntr     (n_it)) ')'])
          
        PRMS_ACLAB.final_report_out(33,2) =                   round(cr_explore_pc (n_it),2); 
        PRMS_ACLAB.final_report_out(34,2) =                   cr_explore_cntr     (n_it); 
        
        disp(['[-- 18 --] CR Approaching (% it.s) ' num2str(round(cr_approach_pc(n_it),2)) '%' ...
              '   ('                                  num2str(cr_approach_cntr    (n_it)) ')'])
          
        PRMS_ACLAB.final_report_out(35,2) =                   round(cr_approach_pc(n_it),2); 
        PRMS_ACLAB.final_report_out(36,2) =                   cr_approach_cntr    (n_it); 
        
        disp(['---------------------------------------------------'])
        disp(['--- FINAL REPORT - END ----------------------------'])
        disp(['---------------------------------------------------'])
        
    end
   
   
% -------------------------------------------------------------------
% --- write results to the screen - end -----------------------------
% -------------------------------------------------------------------
    
% -------------------------------------------------------------------
% --- plot ----------------------------------------------------------
% -------------------------------------------------------------------
                
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% PLOT DIAGRAMS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % -----------------------------------------------------
    % --- Decide if plotting only the active dimensions ---
    % -----------------------------------------------------
    
    selective_plots = PRMS_ACLAB.selective_plots;
    %if true,  only the active dimensions are plotted
    %if false, everything is plotted
      
    cf2_plot_on = true;
    cf3_plot_on = true;
    cf4_plot_on = true;
    
    if  selective_plots
        if ~cf2_on
            cf2_plot_on = false;
        end
        
        if ~cf3_on
            cf3_plot_on = false;
        end
        
        if ~cf4_on
            cf4_plot_on = false;
        end
    end
    
    %----------------------------------
    plot_set_up % set-up colors and positions (m-file)
    %----------------------------------
    
    %----------------------------------
    plot_stats_plot_setup
    %set up plots' flags and names (m-file)
    %plot_stats_plot_cf2.m
    %plot_stats_plot_cf3.m
    %plot_stats_plot_cf4.m
    %----------------------------------
    
    %----------------------------------
    if PRMS_ACLAB.out_plot == 1
        f_lab_on = false; %lab off
    else
        f_lab_on = true; %lab on
    end
    %----------------------------------
    
    %- override flags -----------------
    %flags - are set in plot_stats_plot_setup.m and
    %      - control + plot_stats_plot_cf2.m
    %                + plot_stats_plot_cf3.m
    %                + plot_stats_plot_cf4.m
    %-- see plot_stats_plot_setup.m for plot content --

    %f0_on = false; %diagram - Trajectories/Relative Trajectory/Distance
    f1_on = false; %diagram - i/d/d
    f2_on = false; %diagram - x (drives)
    f3_on = false; %diagram - p (Needs)
    f4_on = false; %diagram - no care counter (K)
    f5_on = false; %diagram
    
    %--------------------------------------------
    fx_on = true; % mixed plot (K, x, Se/Dp/Vu)
    if PRMS_ACLAB.out_plot == -1 || ...
       PRMS_ACLAB.out_plot == 0
        fx_on = false;
    end
    %--------------------------------------------

    %--- LAB FLAG OVERRIDE ----------------------
    %f_lab_on = false;
    %f_lab_on = true;
    %--------------------------------------------

    %--- if lab is on - shut down anything else -
    if f_lab_on == true
        f0_on = false;
        f1_on = false;
        f2_on = false;
        f3_on = false;
        f4_on = false;
        f5_on = false;
        fx_on = false;
    end
    %--------------------------------------------

    ftest_on = false;
    
    %----------------------------------
       
    % -----------------------------------------------------
    if f0_on 
        
        Lab_D_on        = true;
        Trajectories_on = true;
        XY_D_on         = true;
        
        start_it_plot = (tot_it-200);
        if start_it_plot < 1
            start_it_plot = 1;
        end
        
        if Lab_D_on
        %------------------------------
        %- Lab Distance ---------------
        %------------------------------
        double_plot_99 = false;
        %double_plot_99 = true;
        smooth_on = false;
        smooth_on = true;
        %------------------------------
        if double_plot_99
        %------------------------------
        %- double plot ----------------
        f0=figure(99);
        set(f0,'Units','Normalized');
        set(f0,'Position',pos1);
    
        subplot(2,1,1),cla
        if smooth_on
            N = 5;
            d_cd_cr_filtered = d_cd_cr(1:N_IT+1);
            K =  ones(1,N)/N;
            d_cd_cr_filtered = conv(d_cd_cr_filtered, K, 'same');
            subplot(2,1,1),plot((0:N_IT),d_cd_cr_filtered(1:N_IT+1),clr_blk);
        else
        subplot(2,1,1),plot((0:N_IT),d_cd_cr(1:N_IT+1),clr_blk);
        end
        subplot(2,1,1),axis([0 tot_it 0 1.1*max(d_cd_cr)]); 
        %subplot(2,1,1),axis([tot_it-200 tot_it 0 1.1*max(d_cd_cr)]);%last 200
        subplot(2,1,1),title(title_f0_1);
        
        subplot(2,1,2),cla
        subplot(2,1,2),plot((0:N_IT),d_cd_cr_m(1:N_IT+1),clr_red);
        subplot(2,1,2),axis([0 tot_it 0 1.1*max([d_cd_cr_m 0.1])]);
        %subplot(2,1,2),axis([tot_it-200 tot_it 0 1.1*max(d_cd_cr_m)]);%last 200
        subplot(2,1,2),title(title_f0_2);
        %------------------------------
        else
        %------------------------------
        %- single plot ----------------
        f0=figure(99);
        set(f0,'Units','Normalized');
        set(f0,'Position',pos9);
        %set(f0,'Position',get(0, 'Screensize'));%full screen image
        
        if smooth_on
            N = 9;
            d_cd_cr_filtered = d_cd_cr(1:N_IT+1);
            K =  ones(1,N)/N;
            d_cd_cr_filtered = conv(d_cd_cr_filtered, K, 'same');
            plot((0:N_IT),d_cd_cr_filtered(1:N_IT+1),clr_blk);
        else
        plot((0:N_IT),d_cd_cr(1:N_IT+1),clr_blk);
        end
        hold on
        plot((0:N_IT),d_cd_cr_m(1:N_IT+1),clr_red);
        hold off
        %axis([0 tot_it 0 ac_lab_size]);
        axis([tot_it-200 tot_it 0 ac_lab_maxd]);%last 200
        %axis([tot_it-200 tot_it 0 ac_lab_maxd]);%last 200 - lab diagonal
        axis square
        title(string(ad_cf) + ' - ' + string(title_f0_1));
        f_name = 'Lab-D-' + string(ad_cf);
        %xlabel('iteration');
        %ylabel('Lab Distance');
        %savefig(f0,f_path+f_name+'.fig');
        saveas(f0,f_path+f_name+'.png');
        %------------------------------
        end
        %------------------------------
        end
        
%         d_cd_cr_2 = sqrt((pos_cd(1,1,N_IT+1)-...      
%                           pos_cr(1,1,N_IT+1)).^2+... 
%                          (pos_cd(1,2,N_IT+1)-...
%                           pos_cr(1,2,N_IT+1)).^2);
        
        if Trajectories_on
        %------------------------------
        %- Trajectories ---------------
        %------------------------------
        %- single plot ----------------
        f77=figure(77);
        set(f77,'Units','Normalized');
        set(f77,'Position',pos9);
        %set(f0,'Position',get(0, 'Screensize'));%full screen image
    
        plot(pos_cd_x(start_it_plot:N_IT+1),pos_cd_y(start_it_plot:N_IT+1),clr_blk);
        set(gca,'color',[100 100 100]/255);
        set(gca,'XTick',[],'YTick',[])
        hold on
        plot(pos_cr_x(start_it_plot:N_IT+1),pos_cr_y(start_it_plot:N_IT+1),clr_wht);
        hold off
        axis([1 ac_lab_size 1 ac_lab_size]);
        axis square
        title(string(ad_cf) + ' - ' + 'Child (black) - Caregiver (white) Trajectories');
        f_name = 'CD-CR-Trajectories-' + string(ad_cf);
        %xlabel('iteration');
        %ylabel('Lab Distance');
        %savefig(f0,f_path+f_name+'.fig');
        f77.InvertHardcopy = 'off';
        saveas(f77,f_path+f_name+'.png');
        %------------------------------
        end
        
        if XY_D_on
        %------------------------------
        %- X-Y Differences ------------
        %------------------------------
        %- single plot ----------------
        f88=figure(88);
        set(f88,'Units','Normalized');
        set(f88,'Position',pos9);
        %set(f0,'Position',get(0, 'Screensize'));%full screen image
    
        %plot(pos_cd_cr_x_d(4800:N_IT+1),pos_cd_cr_y_d(4800:N_IT+1),clr_blk);
        set(gca,'color',[100 100 100]/255);
        set(gca,'XTick',[],'YTick',[])
        hold on
        %plot(-pos_cd_cr_x_d(4800:N_IT+1),-pos_cd_cr_y_d(4800:N_IT+1),clr_wht);
        plot(pos_cd_cr_x_d(start_it_plot:N_IT+1),pos_cd_cr_y_d(start_it_plot:N_IT+1),clr_blk);
        hold off
        axis([-ac_lab_size ac_lab_size -ac_lab_size ac_lab_size]);
        axis square
        %title(string(ad_cf) + ' - ' + 'XY CR-CD Differences');
        %f_name = 'XY CR-CD Differences - ' + string(ad_cf);
        title(string(ad_cf) + ' - ' + 'XY CD-CR Differences');
        f_name = 'XY CD-CR Differences - ' + string(ad_cf);
        %xlabel('iteration');
        %ylabel('Lab Distance');
        %savefig(f0,f_path+f_name+'.fig');
        f88.InvertHardcopy = 'off';
        saveas(f88,f_path+f_name+'.png');
        %------------------------------
        end
    end
    % -----------------------------------------------------
    
    % -----------------------------------------------------
    if cf2_plot_on
        plot_stats_plot_cf2 %plot avoidance graphs   (cf2) (m-file)
    end
    
    if cf3_plot_on
        plot_stats_plot_cf3 %plot ambivalence graphs (cf3) (m-file)
    end
    
    if cf4_plot_on
        plot_stats_plot_cf4 %plot phobicity graphs   (cf4) (m-file)
    end
    % -----------------------------------------------------
     
    % -----------------------------------------------------
        
    % -----------------------------------------------------
    % --- TEST --------------------------------------------
    % -----------------------------------------------------
    if ftest_on
%         ftest=figure(10);
%         set(ftest,'Units','Normalized');
%         set(ftest,'Position',pos0);
%         
%         subplot(4,1,1),cla
%         subplot(4,1,1),plot((0:N_IT),need4_cf3(1:N_IT+1),clr_blk);
%         subplot(4,1,1),axis([0 tot_it 0 1.1]);
%         subplot(4,1,1),title('Child: Need For cf3');
%         
%         subplot(4,1,2),cla
%         subplot(4,1,2),plot((0:N_IT),need2give_cf3(1:N_IT+1),clr_blu);
%         subplot(4,1,2),axis([0 tot_it 0 1.1]);
%         subplot(4,1,2),title('Caregiver: Need to Give cf3');
%         
%         subplot(4,1,3),cla
%         subplot(4,1,3),plot((0:N_IT),p2need_cf3_x(1:N_IT+1),clr_blk);
%         subplot(4,1,3),axis([0 tot_it 0 1.1*max(p2need_cf3_x)]);
%         subplot(4,1,3),title('Child: x of P to Need cf3');
%         
%         subplot(4,1,4),cla
%         subplot(4,1,4),plot((0:N_IT),p2give_cf3_x(1:N_IT+1),clr_blu);
%         subplot(4,1,4),axis([0 tot_it 0 1.1*max(p2give_cf3_x)]);
%         subplot(4,1,4),title('Caregiver: x of P to Give cf3');
    end
    % -----------------------------------------------------
    % -----------------------------------------------------
    % -----------------------------------------------------
              
    drawnow
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% PLOT DIAGRAMS - END - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% PLOT LAB %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %------------------------------------------------------
    if PRMS_ACLAB.out_plot == -1 || ...
       PRMS_ACLAB.out_plot == 1
        f_lab_on = false; %lab off
    end
    %------------------------------------------------------
    
    % -----------------------------------------------------
    if f_lab_on 
        f7=figure(7);

        size = get(lab_ctnr{1,1},'size');  
        F    = get(lab_ctnr{1,1},'field');

        typ = SIGNALS.atype;
        clf %clear previous plot

        set(f7,'Units','Normalized');
        set(f7,'Position',[0.05 0.05 0.66 0.66]);
        v=(1:size);
        [X,Y]=meshgrid(v);

        H=zeros(size,size);

        % --- plot field distribution on plain background -----
        hs = surf(Y,X,H,F); 

        cm = colormap('gray');

        %flip field
        icm=flipud(cm); 
        colormap(icm);

        set(hs,'SpecularExponent',1); %sets up lighting
        set(hs,'SpecularStrength',0.1);
        hold on

        % -----------------------------------------------------
        % --- plot agents on lab ------------------------------
        % -----------------------------------------------------
        for cn=1:length(agt_ctnr) %cycle through each agent in turn
            if typ(cn)>0 %only plot live agents              
                pos=get(agt_ctnr{cn},'pos'); %get current position of agent 

                if isa(agt_ctnr{cn},'child') 

                    % -----------------------------------------
                    % --- Plot Child - BLACK ------------------
                    % -----------------------------------------
                    agt_cd = agt_ctnr{cn};
                    n4_cf2 = agt_cd.need4_cf2; %get child's need for cf2
                    n4_cf3 = agt_cd.need4_cf3; %get child's need for cf3
                    n4_cf4 = agt_cd.need4_cf4; %get child's need for cf4
                    % -----------------------------------------

                    if n4_cf2 && n4_cf3 ||...
                       n4_cf2 && n4_cf4 ||...     
                       n4_cf3 && n4_cf4
                        pt_cd=plot(pos(1),pos(2),clr_mgt_d); %plot child as a magenta dot
                    elseif n4_cf2
                        pt_cd=plot(pos(1),pos(2),clr_ylw_d); %plot child as a yellow  dot
                    elseif n4_cf3    
                        pt_cd=plot(pos(1),pos(2),clr_red_d); %plot child as a red     dot
                    elseif n4_cf4    
                        pt_cd=plot(pos(1),pos(2),clr_grn_d); %plot child as a green   dot
                    else
                        pt_cd=plot(pos(1),pos(2),clr_blk_d); %plot child as a black   dot
                    end

                    if n4_cf2 || n4_cf3 || n4_cf4
                        set(pt_cd,'MarkerSize',15); %size of child marker on plot as a colored dot
                    else
                        set(pt_cd,'MarkerSize',15); %size of child marker on plot as a black   dot
                    end

                elseif isa(agt_ctnr{cn},'caregiver')

                    % -------------------------------------------
                    % --- Plot Caregiver - WHITE ----------------
                    % -------------------------------------------
                    agt_cr  = agt_ctnr{cn};
                    n2g_cf2 = agt_cr.need2give_cf2; %get caregiver's need to give cf2 
                    n2g_cf3 = agt_cr.need2give_cf3; %get caregiver's need to give cf3
                    n2g_cf4 = agt_cr.need2give_cf4; %get caregiver's need to give cf4
                    % -------------------------------------------

                    if n2g_cf2 && n2g_cf3 ||...
                       n2g_cf2 && n2g_cf4 ||...
                       n2g_cf3 && n2g_cf4
                        pt_cr=plot(pos(1),pos(2),clr_mgt_s); %plot caregiver as a magenta star
                    elseif n2g_cf2
                        pt_cr=plot(pos(1),pos(2),clr_ylw_s); %plot caregiver as a yellow  star
                    elseif n2g_cf3
                        pt_cr=plot(pos(1),pos(2),clr_red_s); %plot caregiver as a red     star
                    elseif n2g_cf4
                        pt_cr=plot(pos(1),pos(2),clr_grn_s); %plot caregiver as a green   star
                    else
                        pt_cr=plot(pos(1),pos(2),clr_wht_d); %plot caregiver as a white   dot
                    end

                    if n2g_cf2 || n2g_cf3 || n2g_cf4
                        set(pt_cr,'MarkerSize',20); %size of caregiver marker on plot as a colored star
                    else
                        set(pt_cr,'MarkerSize',40); %size of caregiver marker on plot as a white   dot
                    end

                end
            end
        end
    
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Once all cells are plotted, set up perspective, lighting etc.
        h=findobj(gcf,'type','surface');
        set(h,'edgecolor','none');
        lighting flat
        h=findobj(gcf,'type','surface');
        set(h,'linewidth',0.1)
        set(h,'specularstrength',0.2)
        axis off
        axis equal
        set(gcf,'color',[1 1 1]);

        % --- title ---------------------------------
        plt_ttl_ln1 = 'Attachment-Caregiving Lab';

        plt_ttl_ln2_cd = 'Child: Black Dot ';
        plt_ttl_ln2_cr = 'Caregiver: White Dot ';
        plt_ttl_ln2_ln = ' ---  ';

        if cf2_on
            plt_ttl_ln2_cd_av = ['[ Av = ' num2str(round(ad2_av(n_it),4)) ' ] '];
            plt_ttl_ln2_cr_in = ['[ In = ' num2str(round(cf2_in(n_it),4)) ' ] '];
        else
            plt_ttl_ln2_cd_av = '';%['[ Av = - ] '];
            plt_ttl_ln2_cr_in = '';%['[ In = - ] '];
        end

        if cf3_on
            plt_ttl_ln2_cd_am = ['[ Am = ' num2str(round(ad3_am(n_it),4)) ' ] '];
            plt_ttl_ln2_cr_un = ['[ Un = ' num2str(round(cf3_un(n_it),4)) ' ] '];
        else
            plt_ttl_ln2_cd_am = '';%['[ Am = - ] '];
            plt_ttl_ln2_cr_un = '';%['[ Un = - ] '];
        end
        
        if cf4_on
            plt_ttl_ln2_cd_ph = ['[ Ph = ' num2str(round(ad4_ph(n_it),4)) ' ] '];
            plt_ttl_ln2_cr_li = ['[ Li = ' num2str(round(cf4_li(n_it),4)) ' ] '];
        else
            plt_ttl_ln2_cd_ph = '';%['[ Am = - ] '];
            plt_ttl_ln2_cr_li = '';%['[ Un = - ] '];
        end

        plt_ttl_ln2 = [plt_ttl_ln2_cd plt_ttl_ln2_cd_av plt_ttl_ln2_cd_am plt_ttl_ln2_cd_ph plt_ttl_ln2_ln...
                       plt_ttl_ln2_cr plt_ttl_ln2_cr_in plt_ttl_ln2_cr_un plt_ttl_ln2_cr_li];

        plt_ttl_ln3 = ['Iteration -' num2str(n_it-1) '-' '  Distance = ' num2str(round(d_cd_cr(n_it),2))];

        plt_ttl = [plt_ttl_ln1 newline plt_ttl_ln2 newline plt_ttl_ln3];

        title(plt_ttl);
        % -------------------------------------------

        axis off

        drawnow

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
        if out_imgs == true &&...%create a jpg each iteration !!
           ((N_IT >= out_strt) && (N_IT <= out_end))
            %disp('***WARNING*** creating a jpg each iteration!!! ');
            filenamejpg=[sprintf('%04d',N_IT)];
            f_path_lab = strcat(f_path,'agent_plot_',filenamejpg);
            print(f_path_lab,'-djpeg90'); %print new jpeg to create movie later
        end
    
    end
    % -----------------------------------------------------
    
    % -----------------------------------------------------
    % --- plot agents on lab - end ------------------------
    % -----------------------------------------------------
    
end
    
% -------------------------------------------------------------------
% --- plot - end ----------------------------------------------------
% -------------------------------------------------------------------
    
end
