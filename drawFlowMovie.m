%draws decimated and nondecimated vectors
%using march2020 code, and instead of calculating the decimation
%manually we just use the builtin from plot() :)
hbounds = [300,500];   
wbounds = [200,300]; 
%hbounds = [1 ,581];
%wbounds= [1,739]; 
  DecimationFactor=5;
 ScaleFactor = 2000; 

frames = getFrames("data/KO.avi",2,1:100);
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2));


opticFlow = opticalFlowHS

h = figure;
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1);

for i=1:size(frames,4) 
  
     flow = estimateFlow(opticFlow,frames(:,:,:,i));
     clf;
     subplot(1,2,1); 
     imagesc(frames(:,:,:,i));
     subplot(1,2,2);
     plot(flow,'ScaleFactor',ScaleFactor,'DecimationFactor',[DecimationFactor DecimationFactor]);
     axis([0 diff(wbounds) 0 diff(hbounds)]);
     title(i); 
     pause(10^-2);
end
