function testOnPost(file,theta)
xPost=file(:,37:41);
yPost=file(:,42); %total pre ICA

for i=1:size(xPost,2)
    xPost(:,i)=(xPost(:,i)-mean(xPost(:,i)))/std(xPost(:,i));
end

x0=ones(length(yPost),1);
xFinal=[x0,xPost];
hypothesis=xFinal*theta;



fig1=figure(1);
plot(1:length(yPost),yPost, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','green');
hold on;
plot(1:length(yPost),hypothesis, 'o', 'LineWidth', 3, 'MarkerSize',5,'Color','red');
xlabel('Number of Test Data');
ylabel('y Test and hypothesis');
fname = '..\Results\testOnPost';
saveas(fig1, fullfile(fname,'image'), 'jpeg');
hold off;

R = corrcoef(hypothesis,yPost);
X=[hypothesis,yPost];
corrplot(X);
fname = '..\Results\testOnPost';
saveas(gcf, fullfile(fname, 'correlationCoef'), 'jpeg');
hold off;





