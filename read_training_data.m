function [Q] = read_training_data(path, number_of_data, dim_resize)
    rows = dim_resize(1) * dim_resize(2);
    Q = zeros(rows, number_of_data);
    dirpath = strcat(path, '*.jpg');
    flowersDir = dir(dirpath);
    nFiles = length(flowersDir);
 
    for i = 1:1:nFiles
        currentFileImage = flowersDir(i).name;
        currentImage = imread(strcat(path,currentFileImage));
        IGray = rgb2gray(currentImage);
        IHisteq = histeq(IGray);
        IResize = imresize(IHisteq, dim_resize);
        oneColImage = IResize(:);
        Q(:,i) = oneColImage;
    end
    
end

