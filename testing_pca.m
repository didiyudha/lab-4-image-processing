clc;
clear;

addpath('./PCA/')
addpath('./helper/')

%% Load variable from training result
% - ModelSVM 
% - DataTrainingPCA

load('DataTrainingPCA');

%% Initialize all given variables for testing data
number_of_data = 5;
total_training_data = 15;
resize_row = 100;
resize_col = 100;
dim_resize = [resize_row resize_col];
Q = zeros(dim_resize(1)*dim_resize(2), total_training_data);

%% Initialize testing path for each data testing.
rootPath = 'Test/';
sunFlowerPath = strcat(rootPath,'Sunflower/');
dandelionPath = strcat(rootPath, 'Dandelion/');
daisyPath = strcat(rootPath,'Daisy/');

%% Read each training data for Sunflower, Dandelion, and Daisy
% Every single image will be transformed into one row matrix

QSunflowerTesting  = read_training_data_pca(sunFlowerPath, number_of_data,... 
                     dim_resize);
QDandelionTesting  = read_training_data_pca(dandelionPath, number_of_data,...
                     dim_resize);
QDaisyTesting      = read_training_data_pca(daisyPath, number_of_data,...
                     dim_resize);
                 
%% Compose data into one big matrix M X N
% M = number of training data
% N = number of columns

Q(:, 1:5) = QSunflowerTesting;
Q(:, 6:10) = QDandelionTesting;
Q(:, 11:15) = QDaisyTesting;

[PCTesting, eigenVectorTesting, eigenValueTesting] = pca(Q);
features = PCTesting';
% Initialize label of each class.
test_label             = zeros(15, 1);
test_label(1:5, 1)     = 1;
test_label(6:10, 1)    = 2;
test_label(11:15, 1)   = 3;


predictedResult = predict(SVMModel, features);
confusionMatrix = confusionmat(test_label, predictedResult);

eval = Evaluate(test_label,predictedResult);
accuracy = eval(1,1)*100;
sensitivity = eval(1,2)*100;
specificity = eval(1,3)*100;
precision = eval(1,4)*100;
recall = eval(1,5)*100;
f_measure = eval(1,6)*100;

fprintf('Akurasi: %d \n',accuracy);
fprintf('sensitivity: %d \n',sensitivity);
fprintf('specificity: %d \n',specificity);
fprintf('precision: %d \n',precision);
fprintf('recall: %d \n',recall);
fprintf('f_measure: %d \n',f_measure);

