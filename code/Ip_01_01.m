% MATLAB script for Illustrative Problem 1, Chapter 1.
clear all;clc;
n=[-20:1:20];
x=.5*abs(sinc(n/2));
stem(n,x);