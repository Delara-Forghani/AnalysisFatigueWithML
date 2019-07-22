function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)


m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters   
   J=costFunction(X,y,theta);
   thetaChange=(alpha/m)*(X'*((X*theta)-y)); 
   theta=theta-thetaChange;
   J_history(iter,1)=J;
        
end    
    
    
