%This matlab script uses a linear regretion to predict total fatigue
%score and to predict differnet types of fatigue.

dataFile = xlsread('..\fatigue\Data\postTest');
age = dataFile(:,1);  % takes the third column from the file
gender=dataFile(:,3);
shiftTime=dataFile(:,7);
ICAScore=dataFile(:,42);
y=dataFile(:,37); %total fatigue result
x=[age,gender,ICAScore];
rand = randperm(50);
for i=1:5
    tempx = x;
    xTest=tempx(rand((i*10)-9:i*10),:);
    tempx(rand((i*10)-9:i*10),:)=[];
    xTrain=tempx;
    
    
    tempy = y;
    yTest=tempy(rand((i*10)-9:i*10),:);
    tempy(rand((i*10)-9:i*10),:)=[];
    yTrain=tempy;
    
    [finalTheta, mean,std]=crossValidate(xTrain,yTrain,i);
    Test(xTest,yTest,finalTheta,mean,std,i);
    
end

