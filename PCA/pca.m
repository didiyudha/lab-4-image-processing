function [values, vectors] = pca(Q)
    
    % Count mean per columns.
    M = mean(Q);
    
    % Subtracting the mean column value.
    C = Q - M;
    
    % Covarain matrix.
    V = cov(C);
    
    % Eigen value and egigen vector.
    [values, vectors] = eig(V);
end

