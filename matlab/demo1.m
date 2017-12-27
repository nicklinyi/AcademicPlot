clear all;
close all;
clc;

% create an example of subplots with tight margins
fy = 1;
wy = 2*pi*fy;
fs = 60;
tiv = 1/fs;
t = 0:tiv:(3-tiv);
ys = sin(wy*t);

d = ys.*M;

%% 1D FFT
yk = fft(ys);
Mk = fft(M);
dk = fft(d);

%% fftshift
ytmp = abs(fftshift(yk));
Mtmp = abs(fftshift(Mk));
dtmp = abs(fftshift(dk));

nk = length(ytmp)/2;
k = linspace(0,fs*2,nk);

margin = [0.06 0.06]; % This is the best interval after many tests.
%% plot
figure;
subplot_tight(3,2,1,margin);
plot(t,ys,'b.');
subplot_tight(3,2,2,margin);
plot(k,ytmp(length(ytmp)/2+1:end),'b.');

subplot_tight(3,2,3,margin);
plot(t,M,'b.');
ylabel('Amplitude');
subplot_tight(3,2,4,margin);
plot(k,Mtmp(length(Mtmp)/2+1:end),'b.');

subplot_tight(3,2,5,margin);
plot(t,d,'b.');
xlabel('Time (s)');
subplot_tight(3,2,6,margin);
plot(k,dtmp(length(dtmp)/2+1:end),'b.');
xlabel('Frequency (Hz)')

set(gcf,'PaperPosition',[0 0 20 18])
print('demo1.png','-r600','-dpng') 
