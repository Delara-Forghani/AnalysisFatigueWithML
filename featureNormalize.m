function X=featureNormalize(input1,input2,input3,input4,input5,y)
 input1=(input1-mean(input1))/std(input1);
 input2=(input2-mean(input2))/std(input2);
 input3=(input3-mean(input3))/std(input3);
 input4=(input4-mean(input4))/std(input4);
 input5=(input5-mean(input5))/std(input5);
 m = length(y); % number of training examples
 %hypothesis=theta'*x;
 x0=ones(m,1);
 X=[x0,input1,input2,input3,input4,input5];
end