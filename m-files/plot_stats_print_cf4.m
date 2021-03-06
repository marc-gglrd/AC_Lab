%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% --- cf4 plot_stats print on screen ------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------

    if cf4_on
        disp(strcat('(07) Phobicity  (ad4) [- ON -] = ',      num2str(round(ad4_ph(n_it),4)))) 
        disp(strcat('(08) Limitation (cf4) [- ON -] = ',      num2str(round(cf4_li(n_it),4))))
%     else
%         disp(strcat('(07) Phobicity  (ad4) [OFF] = ',         num2str(round(ad4_ph(n_it),4)))) 
%         disp(strcat('(08) Limitation (cf4) [OFF] = ',         num2str(round(cf4_li(n_it),4))))
    end
    
    if cf4_on         
        disp(strcat('(09) x of P to need cf4     [- ON -] = ',num2str(round(p2need_cf4_x   (n_it),4)),...
                    '   m = ',                                num2str(round(p2need_cf4_x_m (n_it),4)),...
                    '   sd = ',                               num2str(round(p2need_cf4_x_sd(n_it),4))))
        disp(strcat('(10) x of P to give cf4     [- ON -] = ',num2str(round(p2give_cf4_x   (n_it),4)),...
                    '   m = ',                                num2str(round(p2give_cf4_x_m (n_it),4)),...
                    '   sd = ',                               num2str(round(p2give_cf4_x_sd(n_it),4))))  
        disp(strcat('(11) x-fix of P to need cf4 [- ON -] = ',num2str(round(p2need_cf4_xf  (n_it),4))))
        disp(strcat('(12) x-fix of P to give cf4 [- ON -] = ',num2str(round(p2give_cf4_xf  (n_it),4))))
        disp(strcat('(13) P to need cf4          [- ON -] = ',num2str(round(p2need_cf4     (n_it),4)),...
                    '   m = ',                                num2str(round(p2need_cf4_m   (n_it),4)),...
                    '   sd = ',                               num2str(round(p2need_cf4_sd  (n_it),4))))
        disp(strcat('(14) P to give cf4          [- ON -] = ',num2str(round(p2give_cf4     (n_it),4)),...
                    '   m = ',                                num2str(round(p2give_cf4_m   (n_it),4)),...
                    '   sd = ',                               num2str(round(p2give_cf4_sd  (n_it),4))))
%     else
%         disp(strcat('(09) x of P to need cf4     [OFF] = ',num2str(round(p2need_cf4_x   (n_it),4)),...
%                     '   m = ',                             num2str(round(p2need_cf4_x_m (n_it),4)),...
%                     '   sd = ',                            num2str(round(p2need_cf4_x_sd(n_it),4))))
%         disp(strcat('(10) x of P to give cf4     [OFF] = ',num2str(round(p2give_cf4_x   (n_it),4)),...
%                     '   m = ',                             num2str(round(p2give_cf4_x_m (n_it),4)),...
%                     '   sd = ',                            num2str(round(p2give_cf4_x_sd(n_it),4))))
%         disp(strcat('(11) x-fix of P to need cf4 [OFF] = ',num2str(round(p2need_cf4_xf  (n_it),4))))
%         disp(strcat('(12) x-fix of P to give cf4 [OFF] = ',num2str(round(p2give_cf4_xf  (n_it),4))))
%         disp(strcat('(13) P to need cf4          [OFF] = ',num2str(round(p2need_cf4     (n_it),4)),...
%                     '   m = ',                             num2str(round(p2need_cf4_m   (n_it),4)),...
%                     '   sd = ',                            num2str(round(p2need_cf4_sd  (n_it),4))))
%         disp(strcat('(14) P to give cf4          [OFF] = ',num2str(round(p2give_cf4     (n_it),4)),...
%                     '   m = ',                             num2str(round(p2give_cf4_m   (n_it),4)),...
%                     '   sd = ',                            num2str(round(p2give_cf4_sd  (n_it),4))))
    end
            
    disp(strcat('---   ---   ---   ---   ---   ---   ---   ---   ---'))
    
    if cf4_on
        disp(strcat('(15) CD need4     cf4 [- ON -] = ',num2str(need4_cf4    (n_it))))
        disp(strcat('(16) CR need2give cf4 [- ON -] = ',num2str(need2give_cf4(n_it))))
        disp(strcat('(17) n4 -> n2g    cf4 [- ON -] = ',num2str(n4_n2g_cf4   (n_it))))
        disp(strcat('(18) n2g -> n4    cf4 [- ON -] = ',num2str(n2g_n4_cf4   (n_it))))
        disp(strcat('(19) n4-n2g AST   cf4 [- ON -] = ',num2str(n4_n2g_st_cf4(n_it)))) 
        disp(strcat('(20) n4 -> No-n2g cf4 [- ON -] = ',num2str(n4_nn2g_cf4  (n_it))))
        disp(strcat('(21) n2g -> No-n4 cf4 [- ON -] = ',num2str(n2g_nn4_cf4  (n_it))))
%     else
%         disp(strcat('(15) CD need4     cf4 [OFF] = ',num2str(need4_cf4    (n_it))))
%         disp(strcat('(16) CR need2give cf4 [OFF] = ',num2str(need2give_cf4(n_it))))
%         disp(strcat('(17) n4 -> n2g    cf4 [OFF] = ',num2str(n4_n2g_cf4   (n_it))))
%         disp(strcat('(18) n2g -> n4    cf4 [OFF] = ',num2str(n2g_n4_cf4   (n_it))))
%         disp(strcat('(19) n4-n2g AST   cf4 [OFF] = ',num2str(n4_n2g_st_cf4(n_it)))) 
%         disp(strcat('(20) n4 -> No-n2g cf4 [OFF] = ',num2str(n4_nn2g_cf4  (n_it))))
%         disp(strcat('(21) n2g -> No-n4 cf4 [OFF] = ',num2str(n2g_nn4_cf4  (n_it))))
    end
    
    disp(strcat('---   ---   ---   ---   ---   ---   ---   ---   ---'))
    
    if cf4_on
        disp(strcat('(22) Tot. CD need4      cf4 [- ON -] = ',num2str(round(need4_cf4_cntr    (n_it),4)),...
                    '   (',                                   num2str(round(need4_cf4_pc      (n_it),2)),'%)'))
        disp(strcat('(23) Tot. CR need2give  cf4 [- ON -] = ',num2str(round(need2give_cf4_cntr(n_it),4)),...
                    '   (',                                   num2str(round(need2give_cf4_pc  (n_it),2)),'%)'))
        disp(strcat('(24) Tot. n4 -> n2g     cf4 [- ON -] = ',num2str(round(n4_n2g_cf4_cntr   (n_it),4))))
        disp(strcat('(25) Tot. n2g -> n4     cf4 [- ON -] = ',num2str(round(n2g_n4_cf4_cntr   (n_it),4))))
        disp(strcat('(26) Tot. n4-n2g AST    cf4 [- ON -] = ',num2str(round(n4_n2g_st_cf4_cntr(n_it),4))))
        disp(strcat('(27) Tot. n4 -> No-n2g  cf4 [- ON -] = ',num2str(round(n4_nn2g_cf4_cntr  (n_it),4))))
        disp(strcat('(28) Tot. n2g -> No-n4  cf4 [- ON -] = ',num2str(round(n2g_nn4_cf4_cntr  (n_it),4))))
        disp(strcat('(29) Iterations with no cf4 [- ON -] = ',num2str(round(no_cf4_cntr       (n_it),4)),...
                    '   m = ',                                num2str(round(no_cf4_m          (n_it),4)),...
                    '   sd = ',                               num2str(round(no_cf4_sd         (n_it),4))))
%     else 
%         disp(strcat('(22) Tot. CD need4      cf4 [OFF] = ',num2str(round(need4_cf4_cntr    (n_it),4)),...
%                     '   (',                                num2str(round(need4_cf4_pc      (n_it),2)),'%)'))
%         disp(strcat('(23) Tot. CR need2give  cf4 [OFF] = ',num2str(round(need2give_cf4_cntr(n_it),4)),...
%                     '   (',                                num2str(round(need2give_cf4_pc  (n_it),2)),'%)'))
%         disp(strcat('(24) Tot. n4 -> n2g     cf4 [OFF] = ',num2str(round(n4_n2g_cf4_cntr   (n_it),4))))
%         disp(strcat('(25) Tot. n2g -> n4     cf4 [OFF] = ',num2str(round(n2g_n4_cf4_cntr   (n_it),4))))
%         disp(strcat('(26) Tot. n4-n2g AST    cf4 [OFF] = ',num2str(round(n4_n2g_st_cf4_cntr(n_it),4))))
%         disp(strcat('(27) Tot. n4 -> No-n2g  cf4 [OFF] = ',num2str(round(n4_nn2g_cf4_cntr  (n_it),4))))
%         disp(strcat('(28) Tot. n2g -> No-n4  cf4 [OFF] = ',num2str(round(n2g_nn4_cf4_cntr  (n_it),4))))
%         disp(strcat('(29) Iterations with no cf4 [OFF] = ',num2str(round(no_cf4_cntr       (n_it),4)),...
%                     '   m = ',                             num2str(round(no_cf4_m          (n_it),4)),...
%                     '   sd = ',                            num2str(round(no_cf4_sd         (n_it),4))))
    end 
    
    disp(strcat('---   ---   ---   ---   ---   ---   ---   ---   ---'))
    
    if cf4_on  
        disp(strcat('(30) CD vulnerability (cf4)        [- ON -] = ',num2str(round(cf4_vu_cd     (n_it),4)),...
                    '   m = ',                                    num2str(round(cf4_vu_cd_m   (n_it),4)),...
                    '   sd = ',                                   num2str(round(cf4_vu_cd_sd  (n_it),4)),...
                    ' [',                                         num2str(round(cf4_vu_m2t_cd (n_it),4)),']'))
        disp(strcat('(31) CR vulnerability (cf4)        [- ON -] = ',num2str(round(cf4_vu_cr     (n_it),4)),...
                    '   m = ',                                    num2str(round(cf4_vu_cr_m   (n_it),4)),...
                    '   sd = ',                                   num2str(round(cf4_vu_cr_sd  (n_it),4)),...
                    ' [',                                         num2str(round(cf4_vu_m2t_cr (n_it),4)),']'))
        disp(strcat('(32) CD target vulnerability (cf4) [- ON -] = ',num2str(round(cf4_vu_trgt_cd(n_it),4)))) 
        disp(strcat('(33) CR target vulnerability (cf4) [- ON -] = ',num2str(round(cf4_vu_trgt_cr(n_it),4))))
        disp(strcat('(34) CD distancing (cf4)           [- ON -] = ',num2str(round(cf4_d_cd      (n_it),4)),...
                    '   m = ',                                    num2str(round(cf4_d_cd_m    (n_it),4)),...
                    '   sd = ',                                   num2str(round(cf4_d_cd_sd   (n_it),4)),...
                    ' [',                                         num2str(round(cf4_d_m2t_cd  (n_it),4)),']'))
        disp(strcat('(35) CR distancing (cf4)           [- ON -] = ',num2str(round(cf4_d_cr      (n_it),4)),...
                    '   m = ',                                    num2str(round(cf4_d_cr_m    (n_it),4)),...
                    '   sd = ',                                   num2str(round(cf4_d_cr_sd   (n_it),4)),...
                    ' [',                                         num2str(round(cf4_d_m2t_cr  (n_it),4)),']'))
        disp(strcat('(36) CD target distancing (cf4)    [- ON -] = ',num2str(round(cf4_d_trgt_cd (n_it),4))))        
        disp(strcat('(37) CR target distancing (cf4)    [- ON -] = ',num2str(round(cf4_d_trgt_cr (n_it),4))))        
        %disp(strcat('(38) CD d-fix (cf4)                [- ON -] = ',num2str(round(cf4_df_cd     (n_it),4))))        
        %disp(strcat('(39) CR d-fix (cf4)                [- ON -] = ',num2str(round(cf4_df_cr     (n_it),4))))
        disp(strcat('(38) CD d-fix (cf4)                [- OFF -]'))        
        disp(strcat('(39) CR d-fix (cf4)                [- OFF -]'))
%     else
%         disp(strcat('(30) CD vulnerability (cf4)        [OFF] = ',num2str(round(cf4_vu_cd     (n_it),4)),...
%                     '   m = ',                                 num2str(round(cf4_vu_cd_m   (n_it),4)),...
%                     '   sd = ',                                num2str(round(cf4_vu_cd_sd  (n_it),4)),...
%                     ' [',                                      num2str(round(cf4_vu_m2t_cd (n_it),4)),']'))
%         disp(strcat('(31) CR vulnerability (cf4)        [OFF] = ',num2str(round(cf4_vu_cr     (n_it),4)),...
%                     '   m = ',                                 num2str(round(cf4_vu_cr_m   (n_it),4)),...
%                     '   sd = ',                                num2str(round(cf4_vu_cr_sd  (n_it),4)),...
%                     ' [',                                      num2str(round(cf4_vu_m2t_cr (n_it),4)),']'))
%         disp(strcat('(32) CD target vulnerability (cf4) [OFF] = ',num2str(round(cf4_vu_trgt_cd(n_it),4)))) 
%         disp(strcat('(33) CR target vulnerability (cf4) [OFF] = ',num2str(round(cf4_vu_trgt_cr(n_it),4))))
%         disp(strcat('(34) CD distancing (cf4)           [OFF] = ',num2str(round(cf4_d_cd      (n_it),4)),...
%                     '   m = ',                                 num2str(round(cf4_d_cd_m    (n_it),4)),...
%                     '   sd = ',                                num2str(round(cf4_d_cd_sd   (n_it),4)),...
%                     ' [',                                      num2str(round(cf4_d_m2t_cd  (n_it),4)),']'))
%         disp(strcat('(35) CR distancing (cf4)           [OFF] = ',num2str(round(cf4_d_cr      (n_it),4)),...
%                     '   m = ',                                 num2str(round(cf4_d_cr_m    (n_it),4)),...
%                     '   sd = ',                                num2str(round(cf4_d_cr_sd   (n_it),4)),...
%                     ' [',                                      num2str(round(cf4_d_m2t_cr  (n_it),4)),']'))
%         disp(strcat('(36) CD target distancing (cf4)    [OFF] = ',num2str(round(cf4_d_trgt_cd (n_it),4))))        
%         disp(strcat('(37) CR target distancing (cf4)    [OFF] = ',num2str(round(cf4_d_trgt_cr (n_it),4))))        
%         disp(strcat('(38) CD d-fix (cf4)                [OFF] = ',num2str(round(cf4_df_cd     (n_it),4))))        
%         disp(strcat('(39) CR d-fix (cf4)                [OFF] = ',num2str(round(cf4_df_cr     (n_it),4))))
    end
    
    disp(strcat('---------------------------------------------------'))
    
