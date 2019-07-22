function [xFinal,meanValue,stdDev]=Normalization(X,y)

m = length(y); % number of training examples
meanValue=[];
stdDev=[];
for i=1:size(X,2)
    meanValue=[meanValue mean(X(:,i))];
    stdDev=[stdDev std(X(:,i))];
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
    %hypothesis=theta'*x;
    
end
x0=ones(m,1);
xFinal=[x0,X];