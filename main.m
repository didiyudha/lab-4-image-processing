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

%% Initialize training path for each data.
rootPath = 'Train/';
sunFlowerPath = strcat(rootPath,'Sunflower/');
dandelionPath = strcat(rootPath, 'Dandelion/');
daisyPath = strcat(rootPath,'Daisy/');

%% Read each training data for Sunflower, Dandelion, and Daisy
% Every single image will be transformed into one row matrix

QSunflower  = read_training_data_pca(sunFlowerPath, number_of_data,... 
              dim_resize);
QDandelion  = read_training_data_pca(dandelionPath, number_of_data,...
              dim_resize);
QDaisy      = read_training_data_pca(daisyPath, number_of_data,...
              dim_resize);

%% Compose data into one big matrix M X N
% M = number of training data
% N = number of columns

Q(1:10, :) = QSunflower;
Q(11:20, :) = QDandelion;
Q(21:30, :) = QDaisy;

%% Mean of each column of Q
QMean = mean(Q);

%% Find PCA
PCA = pca(Q);
PC = Q * PCA;

save('DataTrainingPCA', 'PC', 'QMean');

%% Training data after get the result from PCA.

% Initialize label of each class.
train_label             = zeros(30, 1);
train_label(1:10, 1)    = 1;
train_label(11:20, 1)   = 2;
train_label(21:30, 1)   = 3;

%% Support Vector Machine (SVM) training.
ModelSVM = svm.train(PC, train_label);
save('ModelSVM', 'ModelSVM');


