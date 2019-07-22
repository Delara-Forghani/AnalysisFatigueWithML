%This matlab script uses a linear regretion to predict total fatigue 
%score and to predict differnet types of fatigue.

dataFile = xlsread('..\fatigue\Data\postTest');
age = dataFile(:,1);  % takes the third column from the file
gender=dataFile(:,3); 
firstICA=dataFile(:,6);
shiftTime=dataFile(:,7);
education=dataFile(:,10);
y=dataFile(:,42); %total fatigue result
%generalFatigue=dataFile(:,37); 
%physicalFatigue=dataFile(:,38);
%mentalFatigue=dataFile(:,39);
%activityLoss=dataFile(:,40);
%motivationLoss=dataFile(:,41);
m=length(y);
X=featureNormalize(age,gender,firstICA,shiftTime,education,y);
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
%saveas(fig,'errorFunction.png');
figure(2);
plot(1:m,y, '.', 'LineWidth', 4, 'MarkerSize',30,'Color','blue');
hold on;
plot(1:m,finalHypothesis, '*', 'LineWidth', 2, 'MarkerSize',10,'Color','red');
xlabel('Number of iterations');
ylabel('ICA Result Prediction');
legend('y versus hypothesis of theta');

