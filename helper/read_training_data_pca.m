%% Read data training Principal Component Anaylisis (PCA)
% This function will read data training in given training path,
% read every single image data, and transform image into one col.

function [Q] = read_training_data_pca(path, number_of_data, dim_resize)
    
    % Define columns matrix with multiplying rows * cols.
    cols = dim_resize(1) * dim_resize(2);
    
    % Initialize the matrix output.
    Q = zeros(cols, number_of_data);
    
    % Describe what files will be read.
    dirpath = strcat(path, '*.jpg');
    flowersDir = dir(dirpath);
    
    % Count image file in the current directory.
    nFiles = length(flowersDir);
    
    % Trace every single file.
    for i = 1:1:nFiles
        
        % Get file name of the image i-th.
        currentFileImage = flowersDir(i).name;
        
        % Read the image.
        currentImage = imread(strcat(path,currentFileImage));
        
        % Resize the image and convert the pixels to double type.
        IResize = imresize(currentImage, dim_resize);
        
        % Convert image from RGB to Grayscale.
        IGray = rgb2gray(IResize);
        
        % Transfor image matrix into one col.
        Idouble = double(IGray);
        Q(:, i) = Idouble(:);
        
    end
    
end

