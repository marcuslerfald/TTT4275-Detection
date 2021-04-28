load_data
clf

%% Approximate test statistic using CLT
lambda = 0:0.1:5000;
var_w = var(w);
var_s = var(s_t);
N = length(s_t);

P_D = 1-normcdf(lambda, N*(var_w+var_s), sqrt(N)*(var_w+var_s));
P_FA = 1-normcdf(lambda, N*(var_w), sqrt(N)*(var_w));

P_D_actual = chi2cdf(2*lambda/(var_w+var_s), 2*N, 'upper');
P_FA_actual = chi2cdf(2*lambda/var_w, 2*N, 'upper');

figure(1)
plot(lambda, P_FA)
hold on
plot(lambda, P_FA_actual)
ylabel('P_{FA}')
xlabel("\lambda'")
legend('Approximate P_{FA}', 'Actual P_{FA}')
figure(2)
plot(lambda, P_D)
hold on
plot(lambda, P_D_actual)
ylabel('P_{D}')
xlabel("\lambda'")
legend('Approximate P_{D}', 'Actual P_{D}')
