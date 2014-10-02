function [percent] = accuracy(w,theta,x,y)
numCorrect = 0;
[numTotal,numFeatures] = size(x);
for i = 1:numTotal
    thresh = dot(w,x(i,:)) + theta;
    if thresh * y(i) >= 0
        numCorrect = numCorrect + 1;
    end
end


percent = numCorrect/numTotal;

end

