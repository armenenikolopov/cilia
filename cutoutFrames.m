%get a spatial subsample of the frames across all time and chans. 
%so basically just zoom in.
%maybe ranges should be specified differently, not sure. 
function newframes = cutoutFrames(frames,hrange,wrange)
newframes = frames(hrange,wrange,:,:);
end