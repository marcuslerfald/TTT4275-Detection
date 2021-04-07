addpath('Detection data')
mat = dir('Detection data/*.mat');
for q = 1:length(mat)
    load(mat(q).name);
end
clear mat q