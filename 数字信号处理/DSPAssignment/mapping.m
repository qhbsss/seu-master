%自定义mapping函数：
function [bz,az] = mapping(bZ,aZ,Nz,Dz)
bzord=(length(bZ)-1); %原系统函数分子阶数
bzord1=(length(bZ)-1)*(length(Nz)-1); %变换后系统函数分子阶数
azord=(length(aZ)-1); %原系统函数分母阶数
azord1=(length(aZ)-1)*(length(Dz)-1); %变换后系统函数分母阶数
bz=zeros(1,bzord1+1); %分子系数向量初始化为零
for k=0:bzord %求各多项式乘积结果
    pln=[1];
    for l=0:k-1
        pln=conv(pln, Nz); %求N(z)的k次乘积
    end
    pld=[1];
    for l=0:bzord-k-1
        pld=conv(pld, Dz); %求N(z)的bzord-k次乘积
    end
    bZZ=bZ(k+1)*conv(pln, pld);
    bz=bz+bZ(k+1)*conv(pln, pld); %分子多项式系数向量求和
end
az=zeros(1,azord1+1);
for k=0:azord
    pln=[1];
    for l=0:k-1
        pln=conv(pln, Nz);
    end
    pld=[1];
    for l=0:azord-k-1
        pld=conv(pld,Dz);
    end
    aZZ=aZ(k+1)*conv(pln, pld);
    az=az+aZ(k+1)*conv(pln, pld); %分母多项式系数向量求和
end
az1=az(1);
az=az/az1;
bz=bz/az1;
end