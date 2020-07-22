function [alpha] = Wolfe_Powell(sigma1, sigma2, beta, rho, rho1, d, n, x, nprob)
% Wolfe Powell�㷨   2020.06.15
% @author: ����
% �������ܣ�ʵ��Wolfe_Powell��������������������x�����alpha
% ����˵����
% sigma1(0, 0.5), sigma2(sigma1, 1), beta(0,), rho(0,1), rho1(0,1): ����
% d: �½�����
% n: ά��
% x: �Ա���x
% nprob: ������
% ���˵���� 
% alpha: ����
fk = objfcn(n, x, nprob);
gfk = gradfcn(n, x, nprob);
alpha = 1;
t1 = objfcn(n, x+alpha*d, nprob)<=(fk + sigma1*alpha*gfk'*d);
t2 = gradfcn(n, x+alpha*d, nprob)'*d>=sigma2*gfk'*d;
% ��0����alpha=1���㣨2.7������ȡalpha=1; ����ת��һ��.
if t1&&t2
    return;
end
i = 0;
% ��1����alpha�Ǽ�����ʹ��(2.7)�е�һ������ʽ�����������. i=0.
while(1)
    ak = beta*rho^i;
    t1 = (objfcn(n, x+ak*d, nprob)<=fk + sigma1*ak*gfk'*d);
    if t1  % ���beta*rho^i��������۲�i-1�Ƿ������������������˵�����i��ʹ��һ������ʽ����������i���������������ѭ�����ҵ������i
        i = i-1;
        tempa = beta*rho^i; 
        t1 = (objfcn(n, x+tempa*d, nprob)<=fk + sigma1*tempa*gfk'*d);
        if ~t1
            break;
        end
    else  % ���beta*rho^i����������ak����̫���ˣ�Ӧ������i��ʹ��ak��С
        i = i+1;
    end
end
i=0;
step=2;
while(i<1000)
    % ��2����alpha_k����(2.7)�еĵڶ�������ʽ������ֹ���㣬���ò���alpha��������beta=alpha/rho��ת��3.
    if(step==2)
        t2 = (gradfcn(n, x+ak*d, nprob)'*d>=sigma2*gfk'*d);
        if(t2)
            alpha = ak;
            return;
        end
        betai = ak/rho;
        step = 3;
        j = 0;
        ak1 = ak;
    % ��3����alpha�Ǽ�����ʹ�ã�2.7���е�һ������ʽ�����������.��i=i+1��ת��2.
    else
        t1 = (objfcn(n, x+ak1*d, nprob)<=fk + sigma1*ak1*gfk'*d);
        if t1   % ����ʹ��һ������ʽ������ת��2
            step=2;
            i = i+1;
            ak = ak1;
        else    % �������ѭ��
            ak1 = ak + rho1^j*(betai - ak);
            j = j+1;
        end
    end
end
alpha = 0.02;   % ���������ѭ��������δ�õ����ʵ�alpha���򷵻ظ�ֵ.
        


