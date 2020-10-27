%some unused code i began to write to make it easy to select ROIs by 
%mouse cursor to do analysis. 

nloops =100; 
frames = getFrames("data/KO.avi",2,1:nloops);

f=figure; 

F(nloops) = struct('cdata',[],'colormap',[]);

%draw the image so we can capture it. 
for i=1:nloops
    %draw picture so we can capture it.
    imagesc(frames(:,:,1,i));  
    pause(10^-2); 
end

h2=imfreehand;
mask=createMask(h2);

for i=1:nloops
%draw pic but mask it by the mask created above.     
    imagesc(squeeze(frames(:,:,1,i)).*uint8(mask));   
    pause(10^-2); 
end

