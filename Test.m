function finalTheta=Test(xTest,yTest,finalTheta,mean1,std1,count)

m = length(yTest); % number of training examples
for i=1:size(xTest,2)
    xTest(:,i)=(xTest(:,i)-mean1(:,i))/std1(:,i);
end
x0=ones(m,1);
xFinal=[x0,xTest];

hypothesis=xFinal*finalTheta;


fig1=figure(1);
plot(1:m,yTest, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','green');
hold on;
plot(1:m,hypothesis, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','red');
xlabel('Number of Test Data');
ylabel('y Test and hypothesis');
fname = '..\Results\trainOnPre';
saveas(fig1, fullfile(fname, strcat('image',int2str(count))), 'jpeg');
hold off;

R = corrcoef(hypothesis,yTest);
X=[hypothesis,yTest];
corrplot(X);
fname = '..\Results\trainOnPre';
saveas(gcf, fullfile(fname, strcat('correlationCoef',int2str(count))), 'jpeg');
hold off;

