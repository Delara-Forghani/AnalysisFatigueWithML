dataFile = xlsread('D:\Royan\fatigue\Data\postTest');
 age = dataFile(:,1);  % takes the third column from the file
 gender=dataFile(:,4); 
 shiftTime=dataFile(:,9);
 education=dataFile(:,12);
 y=dataFile(:,43); %fatigue result
 X=featureNormalize(age,gender,shiftTime,education,y);
 n=size(X,2);
 theta=zeros(n,1);
 alpha = 0.01;
 num_iters = 500;
[finalTheta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);
finalHypothesis=X*finalTheta;
figure(1);
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Error Function J');
figure(2);
plot(1:m,y, '.', 'LineWidth', 4, 'MarkerSize',30);
hold on;
plot(1:m,finalHypothesis, '*', 'LineWidth', 2, 'MarkerSize',10,'Color','red');
xlabel('Number of iterations');
ylabel('y and h');
legend('y versus hypothesis');

