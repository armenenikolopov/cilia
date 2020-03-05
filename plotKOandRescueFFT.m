hbounds = [300,500];
wbounds = [200,300]; 

[frames,Fs] = getFrames("data/KO.avi",2);   %get green channel only for KO data
%%only look at a small square bounded by h/wbounds, cilia are here.
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2)); 

%do the FFT calculation
[fko,pko]=calcFramesFFT(frames,Fs);


%%%%%%%%%%
%NOW do above for the rescue. 
[frames,Fs] = getFrames("data/KO+cGMP_.avi",2);   %get green channel only for KO data
%%only look at a small square bounded by h/wbounds, cilia are here.
frames = cutoutFrames(frames,hbounds(1):hbounds(2),wbounds(1):wbounds(2)); 

%do the FFT calculation
[frescue,prescue]=calcFramesFFT(frames,Fs);


%%%%%%%%%%%%%%%%%%%%%

%now print shit
figure;
plot(fko(2:end),pko(2:end),'g'); 
hold on;
plot(frescue(2:end),prescue(2:end),'r');

%label shit
legend('Knockout','rescue'); 
xlabel('f (Hz)')
ylabel('|P1(f)|')

% 
% figure; 
% imagesc(rfo(:,:,2))
% 
% colormap gray
% 
% rectangle('Position',[300,200,200,100],'EdgeColor',[1 0 0],'LineWidth',2)