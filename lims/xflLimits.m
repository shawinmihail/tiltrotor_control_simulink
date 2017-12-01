function f_h_lim = xflLimits( t3_typical, f_v_max_lim, f_h_lim_bound, t_h_lim, t_v_lim, w_lim, th_lim)
T = -t3_typical + t_v_lim/2;
half_f_v_max_lim = f_v_max_lim/2;

f_h_lim = 0;
step = 1;
for f2 = 0:step:f_h_lim_bound
        w3 = W3(f2,half_f_v_max_lim,t_h_lim,T);
        th1 = Th1(f2,half_f_v_max_lim,t_h_lim,T);
        if abs(th1(3)) > th_lim || abs(w3(3)) > w_lim
            f_h_lim = f2 - step;
            break
        end
        f_h_lim = f_h_lim_bound;
end

end

