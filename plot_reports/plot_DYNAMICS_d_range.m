

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- DYNAMICS -------------------------------------- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%- run aclab_go for dimensional values in a given range

d = 'am';  %dimension
its = 5000;%number of iterations

%- range of values ----------
first_value = 0.4;
last_value  = 0.4;
step        = 0.02;
%----------------------------

x = first_value;

while x <= last_value
    x_string = string(x);
    x_string = extractAfter(x_string,2);
    d_v = string(d)+'0'+x_string;
    % - run aclab -----------
    aclab_go(d_v,0,its,0,0,0,true,false);
    % dynamics plots can be activated
    % in plot_stat_plot_cf2.m and plot_stat_plot_cf3.m
    %------------------------
    x = x + step;
end

