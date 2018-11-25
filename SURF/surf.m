function [surfMetric] = surf(trainingPath, dimResize)
    flowerPath = strcat(trainingPath, '*.jpg');
    flowerDir = dir(flowerPath);
    nFlowerFiles = length(flowerDir);
    surfMetric = [];
    
    for i = 1 : nFlowerFiles
       currentFileImage = flowerDir(i).name;
       currentImage = imread(strcat(trainingPath, currentFileImage));
       IResize = imresize(currentImage, dimResize);
       I_GRAY = rgb2gray(IResize); 
       features = detectSURFFeatures(I_GRAY);
       m = features.Metric';
       surfMetric(1, :) = m;
    end
end

