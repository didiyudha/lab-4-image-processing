clear;
clc;

addpath('./PCA/')

%% Initialize all given variables for training data
number_of_data = 10;
total_training_data = 30;
resize_row = 100;
resize_col = 100;
dim_resize = [resize_row resize_col];
Q = zeros(total_training_data, dim_resize(1)*dim_resize(2));

rootPath = 'Train/';
sunFlowerPath = strcat(rootPath,'Sunflower/');
dandelionPath = strcat(rootPath, 'Dandelion/');
daisyPath = strcat(rootPath,'Daisy/');

QSunflower = read_training_data(sunFlowerPath, number_of_data, dim_resize);
QDandelion = read_training_data(dandelionPath, number_of_data, dim_resize);
QDaisy = read_training_data(daisyPath, number_of_data, dim_resize);

Q(1:10, :) = QSunflower;
Q(11:20, :) = QDandelion;
Q(21:30, :) = QDaisy;

%% Find PCA matrix
 CovQ = cov(Q);

% Find eigen vector and eigen value.
[eigenVector, eigenValue] = eig(CovQ);

% Sort eigen vector based on eigen value by descending order.
[row, col] = size(eigenVector);
vrow = zeros(row, col);
idx_vrow = 1;

for i = col:-1:1
    vrow(idx_vrow, :) = eigenVector(:, i)';
    idx_vrow = idx_vrow + 1;
end

PCA = vrow * Q';
PC = PCA * Q';
