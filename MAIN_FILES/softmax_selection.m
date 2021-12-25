av = 0.1
am = 0.2
beta = 1

X = [];
for i= 1:1000
  z = [av + randn(), am + randn()];   % Av and Am + r ~ N(0, 1)
  s = [exp(beta*z(1))/sum(exp(z)),... % softmax
       exp(beta*z(2))/sum(exp(z))];   
  [~, choice] = max(s);               % winner take all (choice is the index of s)
  X = [X, choice];                    %                 (append choice to existing X)
end

hist(X)
