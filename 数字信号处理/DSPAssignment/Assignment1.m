[y,Fs]=audioread("Imagine Dragons-Whatever It Takes.flac");
info = audioinfo("Imagine Dragons-Whatever It Takes.flac");
t = 0:seconds(1/Fs):seconds(3);
t = t(1:end-1);
y1 = y(1:3*Fs);
subplot(231);        % 对图形窗口进行分割
plot(t,y1);
xlabel('Time');
ylabel('Audio Signal');
title('原始信号')
%sound(y1,Fs);
l = 3*Fs;
y2 = abs(fftshift(fft(y1,l)/l));
fd=Fs/l;
fx=fd*(-l/2:l/2-1);      % 将横轴变为频率轴
subplot(234);
plot(fx,y2);
xlabel(' 频率 Hz');
ylabel(' 幅度 ');
title(' 原始信号频谱 ');
t1 = 0:1/Fs:3;
t1 = t1(1:end-1);
noise = 0.05*sin(2*pi*4500*t1);
y3 = y1 + noise;
subplot(232);        % 对图形窗口进行分割
plot(t,y3);
xlabel('Time');
ylabel('Amptitude');
title('加入噪声后信号')
y4 = abs(fftshift(fft(y3,l)/l));
subplot(235);
plot(fx,y4);
xlabel(' 频率 Hz');
ylabel(' 幅度 ');
title(' 加入噪声后信号频谱 ');

fph=4000; 
fsh=4200; 
rp=2; 
rs=15; 
omegaph=fph/(Fs/2); % 归一化  
omegash=fsh/(Fs/2); 
[N,wn]=cheb1ord(omegaph,omegash,rp,rs); 
[BZ,AZ]=cheby1(N,rp,wn,'low');
y5=filter(BZ,AZ,y3);
subplot(233);
plot(t,y5);
xlabel('Time');
ylabel('Amplitude');
title(' 低通滤波后信号时域波形 ');
y6 = abs(fftshift(fft(y5,l)/l));
subplot(236);
plot(fx,y6);
xlabel(' 频率 Hz');
ylabel(' 幅度 ');
title(' 低通滤波后信号频谱');

