function [finalTheta, mean,std] = crossValidate(X, y)
    [XTrain,mean,std]=Normalization(X,y);
    n=size(XTrain,2);    %number of parameters
    theta=zeros(n,1);
    alpha = 0.01;
    num_iters = 500;
   [finalTheta, J_history] = gradientDescent(XTrain, y, theta, alpha, num_iters);
   
   figure(1);
   plot(1:numel(J_history), J_history, '-y', 'LineWidth', 2);
   xlabel('Number of iterations');
   ylabel('Error Function J');
   

   
