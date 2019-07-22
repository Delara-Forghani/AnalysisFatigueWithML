function Test(xTest,yTest,finalTheta,mean1,std1)



m = length(yTest); % number of training examples
for i=1:size(xTest,2)
    xTest(:,i)=(xTest(:,i)-mean1(:,i))/std1(:,i);
end
x0=ones(m,1);
xFinal=[x0,xTest];

hypothesis=xFinal*finalTheta;


figure(2);
plot(1:m,yTest, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','green');
hold on;
plot(1:m,hypothesis, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','red');
xlabel('Number of Test Data');
ylabel('y Test and hypothesis');
