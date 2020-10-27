%plot frequency/power histogram for two diff movies, analyzing only spatial
%window. Most obviously useful in looking at two movies where it['s the
%same set of cells but two conditions.
plotKOandRescueFFT_andROIs;


%Show mean optical flow over time in a single movie over time. The major
%signal here is actually due to jitter in the recording - noise. 
plotMeanFlowTimeline;



%Looking at some rectangular ROI in a given video, does optical flow
%analysis of all pixels for the first 100 frames.
drawFlowMovie;
