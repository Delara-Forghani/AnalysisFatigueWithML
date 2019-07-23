%This matlab script uses a linear regretion to predict total fatigue
%score and to predict differnet types of fatigue.

dataFile = xlsread('..\fatigue\Data\postTest');
general = dataFile(:,37);
physical=dataFile(:,38);
mental=dataFile(:,39);
activity=dataFile(:,40);
motivation=dataFile(:,41);
y=dataFile(:,45); %total ICA

m=length(y);
X=featureNormalize(general,physical,mental,activity,motivation,y);
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
ylabel('Attention Result Prediction');
legend('y versus hypothesis of theta');
