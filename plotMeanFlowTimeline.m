%this file draws a timeline of the mean optical flow vector for each 
%frame. Currently seems to be picking up a lot of jitter noise so need to 
%add dejittering code. 
%this code uses both opticflowHS and opticflow, and I don't yet know
%the difference. 

%hbounds = [300,500];
%wbounds = [200,300]; 

hbounds = [1 ,581];
wbounds= [1,739]; 
frames = getFrames("data/KO.avi",2,1:20);
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2));


opticFlow = opticalFlowHS
meanX=[]; 
meanY=[]; 

for i=1:20 
       flow = estimateFlow(opticFlow,frames(:,:,:,i));
        meanX(i)=mean(mean(flow.Vx));
        meanY(i)=mean(mean(flow.Vy)); 
end

%note that not HS. 
%create a new optic flow object, which just makes printing these guys
%easier. 

meanOpticFlow = opticalFlow(meanX',meanY'); 

%flipping X and Y makes for better display for this particular data set,
%where the cilia are beating left/right
%meanOpticFlow = opticalFlow(meanY,meanX); 
figure; 
plot(meanOpticFlow,'ScaleFactor',1000); 
ylabel('frame'); 

 