load_data

%% Generate the s[n] signal.
s = zeros(length(T1_data_Sk_BPSK),1);
N = length(s);
for n=1:N
    for k=1:N
        s(n) = s(n) + T1_data_Sk_BPSK(k)*exp(1i*2*pi*n*k/N);
    end
    s(n) = s(n)/sqrt(N);
end

s_r = real(s);
s_i = imag(s);

figure(1);
[p_r, x_r] = hist(s_r);
[p_i, x_i] = hist(s_i);

plot(x_r, p_r/sum(p_r));
hold on;
plot(x_i, p_i/sum(p_i));


mu_r = mean(s_r);
mu_i = mean(s_i);
mu_s = mu_r + 1i*mu_i;

var_r = var(s_r);
var_i = var(s_i);
sigma_s = var_r + var_i;

%% Plot pdf(s)

figure(2);
x = [-3:.1:3];
y = normpdf(x, real(mu_s), sigma_s);
plot(x, y);
