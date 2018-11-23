function [PCA] = pca(Q)
    % PCA step by step
    % 1. Make one image into one row
    % 2. Find covariance matrix
    % 3. Find eigen vector and eigen value
    % 4. Sort eigen vector based on eigen value by descending order.
    % 5. Find PCA matrix by multiplying result from step 4 with Q'.

    % Find covariance matrix.
    CovQ = cov(Q);

    % Find eigen vector and eigen value.
    [eigenVector, eigenValue] = eig(CovQ);

    % Sort eigen vector based on eigen value by descending order.
    [row, col] = size(eigenVector);
    vrow = zeros(row, col);
    idx_vrow = 1;

    for i = col:-1:1
        vrow(idx_vrow, :) = eigenVector(:, i)';
        idx_vrow = idx_vrow + 1;
    end

    PCA = vrow * Q';

end
