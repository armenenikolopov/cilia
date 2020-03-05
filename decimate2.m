%2d decimation
function Xnew = decimate2(X,DecimationFactor)

Decimator=ones(DecimationFactor)/DecimationFactor^2; 
    
out = conv2(X,Decimator,'valid');
    Xnew = out(1:DecimationFactor:end,1:DecimationFactor:end);
end 
