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