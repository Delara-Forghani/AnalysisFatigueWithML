function [finalTheta, mean1,std1] = crossValidate(x, y,count)
[xTrain,mean1,std1]=Normalization(x,y);
n=size(xTrain,2);    %number of parameters
theta=zeros(n,1);
alpha = 0.01;
num_iters = 500;
[finalTheta, J_history] = gradientDescent(xTrain, y, theta, alpha, num_iters);

fig=figure(1);
plot(1:numel(J_history), J_history, '-y', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Error Function J');
fname = '..\Results\trainOnPre';
saveas(fig, fullfile(fname, strcat('costFunction',int2str(count))), 'jpeg');
hold off;



