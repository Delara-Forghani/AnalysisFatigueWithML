
dataFile = xlsread('..\fatigue\Data\postTest');
X=(dataFile(:,37:41));
y=dataFile(:,42); %total ICA

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
    
    [finalTheta, mean,std]=crossValidate(xTrain,yTrain);
    Test(xTest,yTest,finalTheta,mean,std);
 
end

