m=5;
x=[1 zeros(1,m-1)];
b=[2 -3 2];
a=[1 -1.25 0.375];
K=0:1:m-1;
y=filter(b,a,x);%由系统函数得到冲激响应
subplot(221)
stem(K,y);
title( ' 冲激响应 ' );
xlabel( 'n' );
ylabel( 'h(n)' );
%[r,p,C] = residuez(b,a);
%syms z n;
%H = (2-3*z^(-1)+2*z^(-2))/(1-1.25*z^(-1)+0.375*z^(-2));
%h = iztrans(H, z, n);
%vpa(subs(h, n, 0))
h_n = y;
x_k = [1, 2, 3, 4, 5, 6, 7];
M = 5;
L = 7;
for k = 1:4
    x_n((k-1)*L+1:L*k) = x_k;%构造输入序列
end
subplot(223)
stem(0:length(x_n)-1,x_n)
title( ' 输入序列 ' );
xlabel( 'n' );
ylabel( 'x(n)' );
H_k = fft(h_n, M+L-1);
y_n = zeros(1, M+L*4-1);
%overlap = zeros(1, M-1);
y_n(1: L+M-1) = ifft(fft(x_n(1:L), M+L-1).*H_k);%重叠相加法+FFT计算输出序列
for k = 2:4
    y_k = ifft(fft(x_n((k-1)*L+1:k*L),M+L-1).*H_k);
    y_n((k-1)*L+1:(k-1)*L+M-1) = y_k(1:M-1)+y_n((k-1)*L+1:(k-1)*L+M-1);
    y_n((k-1)*L+M:k*L+M-1) = y_k(M:L+M-1);
end
subplot(222)
stem(0:length(y_n)-1,y_n)
title( ' 重叠相加法输出序列 ' );
xlabel( 'n' );
ylabel( 'y(n)' );
y_i = conv(x_n,h_n);%直接计算卷积与结果相比较
subplot(224)
stem(0:length(y_i)-1,y_i)
title( ' 直接卷积计算输出序列 ' );
xlabel( 'n' );
ylabel( 'y(n)' );
