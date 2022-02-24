% MATLAB script for Illustrative Problem 7, Chapter 1.
clear all;clc; close all;

fs=20;                      % sampling frequency
ts=1/fs;                    % sampling interval
t=-3:ts:5;                  % time vector

% part 1
x = (t+2).*(t>=-2).*(t<0)+2.*(t>=0).*(t<1)+(2+2*cos(pi/2*t)).*(t>=1).*(t<3)+2.*(t>=3).*(t<4); % x(t)
X = fftshift(fft(x))/fs; % Fourier transform of x(t)
f = linspace(-fs/2,fs/2,length(x)); % freq index
figure(1); plot(t,x),xlabel('time'),ylabel('x(t)')
figure(2); plot(f,abs(X)),xlabel('freq'),ylabel('|X(f)|') % magnitude spectrum

% part 2
lowpass = 1.*(f>-1.5).*(f<=1.5); % ideal lowpass filter
X_lowpass = X.*lowpass; % spectrum of filter output
x_lowpass = ifft(ifftshift(X_lowpass*fs)); % inverse Fourier transform
figure(3); plot(t,x_lowpass),xlabel('time'),ylabel('lowpass filter output')

% part 3
h = t.*(t>=0).*(t<1) + 1.*(t>=1).*(t<=2); % h(t)
y = conv(x,h)/fs; % convolution
figure(4); plot(-6:ts:10,y),xlabel('time'),ylabel('filter output')
% another solution of part 3
H = fftshift(fft(h))/fs;
X_H = X.*H; % spectrum of filter output
x_h = ifftshift(ifft(ifftshift(X_H*fs))); % Some dual property of FFT (or DFT) and CTFT are different
figure(5); plot(t+1,x_h),xlabel('time'),ylabel('filter output')

