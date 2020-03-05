%combines dim 1 and 2 into 1 dim, used for fft. 
%goes from [m,n,a,b] to [m*n,a,b]; that slal it does
function newframes =squashFirstTwoDimensions(frames)
   newframes = reshape(frames,size(frames,1)*size(frames,2),size(frames,3), size(frames,4)); 
end