clc;
clear;

addpath('./LBP/')
SunFlowerTrainingPath = 'Train/Sunflower/';
DandelionTrainingPath = 'Train/Dandelion/';
DaisyTrainingPath = 'Train/Daisy/';
dimResize = [100 100];

lbpFeatures = zeros(30, 59);

sunFlowerFeatures = lbp(SunFlowerTrainingPath, 59, dimResize);
dandelionFeatures = lbp(DandelionTrainingPath, 59, dimResize);
daisyFeatures = lbp(DaisyTrainingPath, 59, dimResize);

lbpFeatures(1:10, :) = sunFlowerFeatures;
lbpFeatures(11:20, :) = dandelionFeatures;
lbpFeatures(21:30, :) = daisyFeatures;