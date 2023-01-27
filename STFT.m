clear;
close all;
clc;
%% Initialize
N = 10000 ;
f=100;
Fs = 5000;
t = 0:1/Fs:2-1/Fs;
F = (-N/2:(N/2)-1)*(Fs/N);
%% Signal
x1 = cos(2*pi*f*t);
x2 = chirp(t,400,2,200);
x3 = zeros(1,2*Fs);
x3(250) = 10 ; 
x = x1 + x2 +x3 ;
%% FFT
X = fftshift(fft(x)) ;
%% STFT
figure(1)
spectrogram(x,hamming(256),220,512,Fs,'yaxis')
colormap jet ;
figure(2)
spectrogram(x,hamming(512),220,512,Fs,'yaxis')
colormap jet ;
%% Plot
figure(1)
% subplot(2,1,1);
plot(t,x);title('Signal in time domain');
xlabel('Time(s)');
ylabel('Magnitude');
% subplot(2,1,2);
plot(F,abs(X));title('Signal in Frequency domain');
xlabel('Frequency(Hz)');
ylabel('Magnitude')
axis([-600,600,0,5500]);
