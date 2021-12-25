function fros = plot_reports_fill_fros(DdXX_number,fro,fros_size)
% ----------------------------------
%Project: AC-Lab by M.G. [created Feb 2020]
%Main Function: aclab_go
% ----------------------------------
fros(1,1) = DdXX_number;%"DdXX" dimension code

for i=2:fros_size
    if i == 2%ITERATIONS
       fros(i,1) = fro(1,2);
    elseif i == 3%Lab Distance
       fros(i,1) = fro(2,2);
    elseif i == 4%Av/In/Ph / Am/Un/Li
       fros(i,1) = fro(3,2);
    elseif i == 5%CD need4 (% it.s)
       fros(i,1) = fro(5,2);
    elseif i == 6%CR need2give (% it.s)
       fros(i,1) = fro(7,2);
    elseif i == 7%It.s (mean) with no cf
       fros(i,1) = fro(9,2);
    elseif i == 8%CD e-distance/p-distance/vulnerability (mean)
       fros(i,1) = fro(11,2);
    elseif i == 9%CR e-distance/p-distance/vulnerability (mean)
       fros(i,1) = fro(14,2);
    elseif i == 10%CD e-distance/p-distance/vulnerability target
       fros(i,1) = fro(17,2);
    elseif i == 11%CR e-distance/p-distance/vulnerability target
       fros(i,1) = fro(18,2);
    elseif i == 12%CD indifference/distancing/distancing (mean)
       fros(i,1) = fro(19,2);
    elseif i == 13%CR indifference/distancing/distancing (mean)
       fros(i,1) = fro(22,2);
    elseif i == 14%CD indifference/distancing/distancing target
       fros(i,1) = fro(25,2);
    elseif i == 15%CR indifference/distancing/distancing target
       fros(i,1) = fro(26,2);
    elseif i == 16%CD Exploring (% it.s)
       fros(i,1) = fro(29,2);
    elseif i == 17%CD Approaching (% it.s)
       fros(i,1) = fro(31,2);
    elseif i == 18%CR Exploring (% it.s)
       fros(i,1) = fro(33,2);
    elseif i == 19%CR Approaching (% it.s)
       fros(i,1) = fro(35,2);
    end
end

