clc
clear all 
close all 
[inp,fsamp]=audioread('C:\Users\Vasu\Desktop\Instrument.mp3')
N=length(inp)
inpt=inp
%inpt=inp(:,1)
inpt=inpt/max(inpt)
inpt=inpt-mean(inpt)
input=filter((1/2000)*ones(1,2000),1,inpt)
t=0:1/fsamp:(N-1)/fsamp
%plot(t,input)
%&freq=fft(input,N)
%power=freq.*conj(freq)/N
%f=(fsamp/N)*(0:1:2^19-1)
%f=(fsamp/N)*(0:1:(N-1))
%plot(f,power(1:N)
p=500
b=fir1(p,0.0091,bartlett(p+1))
output=filter(b,1,input).*filter(b,1,input).*filter(b,1,input)
plot(t,output)
audiowrite('C:\Users\Vasu\Desktop\output.wav',output,fsamp)