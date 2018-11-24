clc;
clear;

addpath('./LBP/')
SunFlowerTrainingPath = 'Train/Sunflower/';
DandelionTrainingPath = 'Train/Dandelion/';
DaisyTrainingPath = 'Train/Daisy/';
dimResize = [100 100];


I = imread(strcat(SunFlowerTrainingPath, 'train_sunflower_9.jpg'));
IResize = imresize(I, dimResize);
IGray = rgb2gray(IResize);
features = detectSURFFeatures(IGray);

imshow(IResize); hold on;
plot(features.selectStrongest(40));