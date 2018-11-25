clc;
clear;

addpath('./SURF/')
SunFlowerTrainingPath = 'Train/Sunflower/';
DandelionTrainingPath = 'Train/Dandelion/';
DaisyTrainingPath = 'Train/Daisy/';
dimResize = [100 100];

sunFlowerSURFfeature = surf(SunFlowerTrainingPath, dimResize);
% surfMetric(1:10, :) = sunFlowerSURFfeature;
% 
% dandelionSURFfeature = surf(DandelionTrainingPath, dimResize);
% surfMetric(11:20, :) = dandelionSURFfeature';
% 
% daisySURFfeature = surf(DaisyTrainingPath, dimResize);
% surfMetric(21:30, :) = daisySURFfeature;