
dataFile = xlsread('..\fatigue\Data\postTest');
preData = xlsread('..\fatigue\Data\preTest');
X=(preData(:,38:42));
y=preData(:,44); %total pre ICA

rand = randperm(50);
for i=1:5
    tempx = X;
    xTest=tempx(rand((i*10)-9:i*10),:);
    tempx(rand((i*10)-9:i*10),:)=[];
    xTrain=tempx;
    
    
    tempy = y;
    yTest=tempy(rand((i*10)-9:i*10),:);
    tempy(rand((i*10)-9:i*10),:)=[];
    yTrain=tempy;
    
    [finalTheta, mean,std]=crossValidate(xTrain,yTrain,i);
    finalTheta2=Test(xTest,yTest,finalTheta,mean,std,i);
    
    
end

testOnPost(dataFile,finalTheta2);

