function [lbpFeatures] = lbp(trainingPath, featureLen, dimResize)
    flowerPath = strcat(trainingPath, '*.jpg');
    flowerDir = dir(flowerPath);
    nFlowerFiles = length(flowerDir);
    lbpFeatures = zeros(nFlowerFiles, featureLen);
    for i = 1:nFlowerFiles
        currentFileImage = flowerDir(i).name;
        currentImage = imread(strcat(trainingPath, currentFileImage));
        IResize = imresize(currentImage, dimResize);
        I_GRAY = rgb2gray(IResize);
        lbpFeatures(i,:) = extractLBPFeatures(I_GRAY, 'NumNeighbors', 8); 
    end 
end

