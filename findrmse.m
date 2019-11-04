function [RMSE] = findrmse(array_y,F2)
    mse=0;
    for i=1:length(array_y)
        mse = mse+(array_y(i)-F2)*(array_y(i)-F2);
    end
    MSE = mse/length(array_y);
    RMSE = sqrt(MSE);