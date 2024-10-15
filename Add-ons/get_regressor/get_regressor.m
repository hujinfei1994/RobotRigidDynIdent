function Y = get_regressor(tau,beta,beta_select)
%% 输入校验
    len_select = length(beta_select);
    len = length(beta);
    %确定len和len_select非空
    if(len<1 || len_select<1)
        error('empty beta or beta_select');
    end
    %确定beta_select是beta的子集
    for i = 1:len_select
        if(~ismember(beta_select{i},beta))
            error('beta_select{i} should be a member of beta');
        end
    end
    
%% 替换：将
    Y = sym(zeros(1,len_select));
    tmp = beta;
    for i = 1:len_select
        % beta先全赋0
        for j = 1:len
            tmp{j} = 0;
        end
        % 相应beta赋1
        [~,loc]=ismember(beta_select{i},beta);
        tmp{loc}=sym(1);
        % 替换
        old = beta;
        new = tmp;
        Y(i)=subs(tau,old,new);
    end

end