% ����Լ������Ĳ����ļ�. �㷨�ľ������뼰����ɼ��㷨ʵ��
nprobs = [22 23 25];  % [21 22 23 25 26];
fprintf('������\t\tʹ�õ��㷨\t\t���д���\t\t����ʱ��\t\t\t�����ݶ�\n');
for nprob = nprobs
    gradient_descent(nprob, 100);
    BFGS(nprob, 100);
end
%% ��ͼ
% subplot(1,3,1);
% plot(sigma1s, iter_num,sigma1s, iter_num2);
% title('����������ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('��������');
% lgd=legend('�����½���','BFGS�㷨');
% set(lgd);
% subplot(1,3,2);
% plot(sigma1s, time,sigma1s, time2);
% title('����ʱ����ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('����ʱ��');
% lgd=legend('�����½���','BFGS�㷨');
% set(lgd);
% subplot(1,3,3);
% plot(sigma1s, value,sigma1s, value2);
% title('Ŀ�꺯���ݶȵ�ģ��ά��n');
% xlabel('����ά��n');
% ylabel('Ŀ�꺯���ݶȵ�ģ');
% lgd=legend('�����½���','BFGS�㷨');
% set(lgd);

% subplot(2,3,4);
% plot(sigma1s, iter_num2);
% title('��������������ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('��������');
% subplot(2,3,5);
% plot(sigma1s, time2);
% title('����ʱ��������ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('����ʱ��');
% subplot(2,3,6);
% plot(sigma1s, value2);
% title('Ŀ�꺯���ݶȵ�ģ������ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('Ŀ�꺯���ݶȵ�ģ');

% ��ctrl+r���Խ��ж���ע�ͣ���ctrl+t���Խ��ж���ȡ��ע��
% f=@(x)x.^2+2.*x+1;          %ͨ���������������������
% syms x;                     %ͨ�����ű�������������ת��Ϊ���ź���
% y=f(x);
% g=matlabFunction(diff(y));   %ͨ��matlabFunction�����ź���ת��Ϊ��������

    