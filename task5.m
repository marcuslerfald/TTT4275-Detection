load_data
clf

%% Plot ROC (Using chi-square with K DOF)
alpha = 0:0.001:1;
var_w = var(w);
var_s = var(s_t);
K = length(s_t);
%lambda = var_w * chi2inv(1- alpha, K) / 2;
%beta = 1 - chi2cdf(2 * lambda /(var_w + var_s),K);
beta = gammainc(var_w/(var_w+var_s)* ... 
    gammaincinv(alpha,K,'upper'),K,'upper');
plot(alpha, beta)
xlabel("P_{FA}")
ylabel("P_D")
