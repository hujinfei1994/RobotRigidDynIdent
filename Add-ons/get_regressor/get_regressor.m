function Y = get_regressor(tau,beta,beta_select)
%% ����У��
    len_select = length(beta_select);
    len = length(beta);
    %ȷ��len��len_select�ǿ�
    if(len<1 || len_select<1)
        error('empty beta or beta_select');
    end
    %ȷ��beta_select��beta���Ӽ�
    for i = 1:len_select
        if(~ismember(beta_select{i},beta))
            error('beta_select{i} should be a member of beta');
        end
    end
    
%% �滻����
    Y = sym(zeros(1,len_select));
    tmp = beta;
    for i = 1:len_select
        % beta��ȫ��0
        for j = 1:len
            tmp{j} = 0;
        end
        % ��Ӧbeta��1
        [~,loc]=ismember(beta_select{i},beta);
        tmp{loc}=sym(1);
        % �滻
        old = beta;
        new = tmp;
        Y(i)=subs(tau,old,new);
    end

end