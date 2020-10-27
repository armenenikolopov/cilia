%fft of images, used by plotKO)andRescueFFT_andROI

function [f,p]=calcFramesFFT(frames,Fs)

framesSquashed = squashFirstTwoDimensions(frames);
framesShifted = permute(framesSquashed,[3 1 2]);

Yv=fft(framesShifted);
L= size(framesShifted,1);
P2 = abs(Yv/L); 
%P1 = P2(1:L/2+1);
%P1 = P2(repmat(1:L/2+1),1,npix); 
P1 = P2(1:L/2+1,:);
P1(2:end-1,:) = 2*P1(2:end-1,:); 
f = Fs*(0:(L/2))/L;

p = mean(P1,2);
%plot(f(2:end),p(2:end))
end
