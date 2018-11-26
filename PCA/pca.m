%%
% PCA step by step
% 1. Make one image into one row
% 2. Find covariance matrix
% 3. Find eigen vector and eigen value
% 4. Sort eigen vector based on eigen value by descending order.
% 5. Find PCA matrix by multiplying result from step 4 with Q'.

function [NewQ, eigenVector, eigenValue] = pca(Q)
    
    Q = bsxfun(@minus, Q, mean(Q, 1));

    % Find covariance matrix.
    CovQ = cov(Q);

    % Find eigen vector and eigen value.
    [eigenVector, eigenValue] = eig(CovQ);

    % Sort eigen vector based on eigen value by descending order.
%     [row, col] = size(eigenVector);
%     vrow = zeros(row, col);
%     idx_vrow = 1;
%     for i = col:-1:1
%         vrow(idx_vrow, :) = eigenVector(:, i)';
%         idx_vrow = idx_vrow + 1;
%     end
    [eigenValue, order] = sort(diag(eigenValue), 'descend');
    eigenVector = eigenVector(:, order);
    
    % Find PCA matrix by multiplying result from step 4 with Q'.
    % PCA = vrow * Q';
    
    % Reduce dimension of data.
    % PC = Q * PCA;
    
    NewQ = Q * eigenVector(:, 1:end);
end
