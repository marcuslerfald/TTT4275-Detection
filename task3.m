load_data
clf

%% Generete x with and without s
var_s = var(s_t);
var_w = var(w);
[p_0, x_0] = hist(2*T3_data_x_H0.*conj(T3_data_x_H0)/var_w);
[p_1, x_1] = hist(2*T3_data_x_H1.*conj(T3_data_x_H1)/(var_s+var_w));

%% Plot pdf(s)
figure(1)
plot(x_0, p_0/sum(p_0));
hold on
plot(x_1, p_1/sum(p_1));
hold on
x = 0:.1:20;
y = chi2pdf(x, 2);
plot(x,y)
legend('x under H_0', 'x under H_1', 'Chi-square')