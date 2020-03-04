%Reads in a filename
%returns an array that is h,w,chan,t
% h=height
% w=with
% chan = number channels
% t= time periods

function [frames, framerate] = getFrames(filename,channels,whichframes) 
v = VideoReader(filename);



%calculate how many frames we are going to use.
%don't specify whichframes, so let's use all of them
if nargin < 3
whichframes = 1:v.NumberOfFrames;
end
nframes = length(whichframes);

%if we don't specify which channels, provide all channels. 
if nargin <2
    channels = [1 2 3];
end


%can check if the frames we asked for exist, but won't do that.

frames = zeros(v.Height,v.Width,length(channels),nframes,'uint8'); 
framerate = v.FrameRate;
tic
for i=1:numframes
    fr = readFrame(v);
    frames(:,:,:,i) = fr(:,:,channels,i);  
end
toc
end
