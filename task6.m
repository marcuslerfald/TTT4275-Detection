load_data
clf

%% Approximate test statistic using CLT
lambda = 0:0.1:5000;
var_w = var(w);
var_s = var(s_t);
K = length(s_t);
P_D = 1-normcdf(lambda, 0.5*K*(var_w+var_s), sqrt(K/4)*(var_w+var_s));
P_FA = 1-normcdf(lambda, K*(var_w), sqrt(K)*(var_w));
P_D_actual = gammainc(lambda/(var_w+var_s), K, 'upper');
P_FA_actual = gammainc(lambda/var_w, K, 'upper');
figure(1)
plot(lambda, P_FA)
hold on
plot(lambda, P_FA_actual)
ylabel('P_{FA}')
xlabel("\lambda'")
legend('Approximate P_{FA}', 'Actual P_{FA}')
figure(2)
plot(lambda, p_d)
hold on
plot(lambda, P_D_actual)
ylabel('P_{D}')
xlabel("\lambda'")
legend('Approximate P_{D}', 'Actual P_{D}')
