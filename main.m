clear;
clc;

addpath('./PCA/')


Q = zeros(40000, 30);
dim_resize = [200 200];
number_of_data = 10;

sunFlowerPath = 'Train/Sunflower/';
dandelionPath = 'Train/Dandelion/';
daisyPath = 'Train/Daisy/';

QSunflower = read_training_data(sunFlowerPath, number_of_data, dim_resize);
QDandelion = read_training_data(dandelionPath, number_of_data, dim_resize);
QDaisy = read_training_data(daisyPath, number_of_data, dim_resize);

Q(:, 1:10) = QSunflower;
Q(:, 11:20) = QDandelion;
Q(:, 21:30) = QDaisy;

[values, vectors] = pca(Q);


