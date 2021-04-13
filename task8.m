load_data
close all

%% Apply NP detector
var_s = 5;
var_w = 1;
N = 256;
P_FA = 0.1;
lambda = sqrt(N)*var_w*norminv(P_FA)+N*var_w;
%P_D = normcdf((lambda-N*(var_s+var_w))/(sqrt(N)*(var_w+var_s)));
NP_detector = NaN(100,2);
hits = 0;
for i = 1:100
    sum(abs(T8_numerical_experiment(:,i)).^2)
    NP_detector(i,1) = sum(abs(T8_numerical_experiment(:,i)).^2)>lambda;
    if NP_detector(i,1) == 1
        hits = hits + 1;
    end
end
plot(1:100, NP_detector(:,1),'r*')
