fp=0.2613*pi;fs=0.4018*pi;rp=0.75;rs=20;f=1; %设计指标
wp1=fp*f;
ws1=fs*f; %根据脉冲响应不变法变换数字滤波器到模拟滤波器指标
[N1,wc1]=buttord(wp1,ws1,rp,rs,'s');%根据模拟指标设计巴特沃斯滤波器
[B1,A1]=butter(N1,wc1,'s'); %得到传递函数
[num1,den1]=impinvar(B1,A1,f);%根据脉冲响应不变法转换成系统函数
freqz(num1,den1); %画出频率响应图像
wp2=2*f*tan(fp/2);
ws2=2*f*tan(fs/2); %根据双线性变换法将数字指标转换为模拟指标
[N2,wc2]=buttord(wp2,ws2,rp,rs,'s');%根据模拟指标设计巴特沃斯滤波器
[B2,A2]=butter(N2,wc2,'s'); %得到传递函数
[num2,den2]=bilinear(B2,A2,f);%根据双线性变换法转换成系统函数
freqz(num2,den2); %画出频率响应图像
[B3,A3]=lp2bs(B1,A1,wc1,0.2*pi);%由模拟低通转化为模拟带阻
[num3,den3]=impinvar(B3,A3,f);%由模拟带阻转化为数字带阻
freqz(num3,den3);%画出数字带阻滤波器频率响应
% bsp1=wc1-0.1*pi;bsp2=wc1+0.1*pi;%设置带阻滤波器阻带频率
% alpha=cos((bsp1+bsp2)/2)/cos((bsp2-bsp1)/2);
% klpha=tan((bsp1+bsp2)/2)*tan(wc1/2);
% d1=-2*alpha/(1+klpha);
% d2=(1-klpha)/(1+klpha);
% Nz=[d2,d1,1];
% Dz=[1,d1,d2];
% [num4,den4]=mapping(num1,den1,Nz,Dz);%根据数字-数字频带变换方法由数字低通变换为数字带阻
% freqz(num4,den4);%画出由数字-数字频带方法得到的带阻滤波器的频率响应