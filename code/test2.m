% ��Լ������Ĳ��Ժ���������ÿ���㷨�����룬�ɲ鿴�㷨ʵ��
%% ���ó��ӷ����De Jong's function
method_of_multipliers('De_Jong', 20);
%% ����Frank Wolfe�㷨���De Jong's function
Frank_Wolfe('De_Jong', 20);
%% ���ó��ӷ����Rastrigin's function
method_of_multipliers('Rastrigin', 20);
%% ����Frank Wolfe�㷨���Rastrigin's function
Frank_Wolfe('Rastrigin', 20);

%% ��ͼ
% sigma1s = 20:20:120;
% iter_num = 20:20:120;  time = 20:20:120; value = 20:20:120;
% iter_num2 = 20:20:120;  time2 = 20:20:120; value2= 20:20:120;
% i=1;
% for sigma1 = sigma1s
%     nprob = 'Rastrigin';
%     [iter_num(i), time(i), value(i)] = method_of_multipliers(nprob, sigma1);
%     [iter_num2(i), time2(i), value2(i)] = Frank_Wolfe(nprob, sigma1);
%     i = i+1;
% end
% subplot(1,3,1);
% plot(sigma1s, iter_num,sigma1s, iter_num2);
% title('����������ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('��������');
% legend('���ӷ�','Frank_Wolfe�㷨');
% subplot(1,3,2);
% plot(sigma1s, time,sigma1s, time2);
% title('����ʱ����ά��n�ı仯');
% xlabel('����ά��n');
% ylabel('����ʱ��');
% legend('���ӷ�','Frank_Wolfe�㷨');
% subplot(1,3,3);
% plot(sigma1s, value,sigma1s, value2);
% title('Ŀ�꺯���ݶȵ�ģ��ά��n');
% xlabel('����ά��n');
% ylabel('Ŀ�꺯���ݶȵ�ģ');
% legend('���ӷ�','Frank_Wolfe�㷨');
