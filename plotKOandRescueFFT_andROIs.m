%Prints FFT of two files for comparison - KO.avi and KO+cGMP_.avi. 
%Becuase of significant blurring in different parts of the images, allows
%you to specify bounds over which to do the analysis, an ROI window,
%specified by hbounds and wbounds. 

hbounds = [300,500];
wbounds = [200,300]; 

pos = [ wbounds(1), ...
        hbounds(1), ...
        wbounds(2)-wbounds(1)+1, ...
        hbounds(2)-hbounds(1)+1];
        
fImage = figure;
fPlot = figure

[frames,Fs] = getFrames("data/KO.avi",2);   %get green channel only for KO data

%plot pitcture befroe overwriting 'frames' variable
figure(fImage);
subplot(2,1,1); 
imagesc(frames(:,:,2));
colormap gray
rectangle('Position',pos,'EdgeColor',[1 0 0],'LineWidth',2)
title('KO'); 

%%only look at a small square bounded by h/wbounds, cilia are here.
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2)); 

%do the FFT calculation
[fko,pko]=calcFramesFFT(frames,Fs);


%%%%%%%%%%
%NOW do above for the rescue. 
[frames,Fs] = getFrames("data/KO+cGMP_.avi",2);   %get green channel only for KO data

figure(fImage);
subplot(2,1,2); 
imagesc(frames(:,:,2));
colormap gray
rectangle('Position',pos,'EdgeColor',[1 0 0],'LineWidth',2);
title('Rescue'); 


%%only look at a small square bounded by h/wbounds, cilia are here.
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2)); 

%do the FFT calculation
[frescue,prescue]=calcFramesFFT(frames,Fs);


%%%%%%%%%%%%%%%%%%%%%

%now print shit
figure(fPlot);
plot(fko(2:end),pko(2:end),'g'); 
hold on;
plot(frescue(2:end),prescue(2:end),'r');

%label shit
legend('Knockout','rescue'); 
xlabel('f (Hz)')
ylabel('|P1(f)|')
