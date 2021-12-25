function [fro_av_all, fros_av_all] = plot_reports_fill_fros_av_all(fros_av_all,fro_size,fros_size,c_mode,tot_it)
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
%%% --- av1 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av01',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(1,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = fro;

%%% --- av2 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av02',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(2,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av3 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av03',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(3,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av4 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av04',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(4,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av5 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av05',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(5,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av6 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av06',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(6,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av7 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av07',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(7,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av8 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av08',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(8,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];

%%% --- av9 ---------------------------
fro = zeros(fro_size,2);
fros = zeros(fros_size,1);

fro = aclab_go('av09',c_mode,tot_it,0,0,0,-1,false);
fros = plot_reports_fill_fros(9,fro,fros_size);
fros_av_all = [fros_av_all, fros];
fro_av_all  = [fro_av_all, fro(:,2)];