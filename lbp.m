clc;
clear;
SunFlowerTrainingPath = 'Train/Sunflower/';
DandelionTrainingPath = 'Train/Dandelion/';
DaisyTrainingPath = 'Train/Daisy/';

I = imread(strcat(SunFlowerTrainingPath, 'train_sunflower_10.jpg'));
I_RGB = rgb2gray(I);
lbp_feature = extractLBPFeatures(I_RGB);