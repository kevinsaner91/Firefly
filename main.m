% ========================================================  % 
% The main is used to automatically conduct the experiments %
% If you want to conduct experiments, comment the parts you %
% are not interested in to save time.                       %
% ========================================================  %    
filename = 'testdata_2dim.xlsx';
n=12;
rand('state',0);  % Reset the random generator
%Standard firefly algorithm
for i=1:100,
    best=firefly_simple([n 100 0 0]);
    str=['A' num2str(i) ':C' num2str(i)];
    sheetname=['Firefly_simple'];
    writematrix(best(n,:),filename,'Sheet',sheetname,'Range',str);
end

% 2-dim hybrid
for j=1:4, %divider
    %rand('state',0);  % Reset the random generator
    for i=1:100,
        best=firefly_simple([n 100 1 j]);
        str=['A' num2str(i) ':C' num2str(i)];
        sheetname=['Firefly_simple_hybrid_'  num2str(j)];
        writematrix(best(n,:),filename,'Sheet',sheetname,'Range',str);
    end   
end

% basic FA
filename = 'testdata_ndim.xlsx';
%rand('state',0);  % Reset the random generator
for i=1:100,
    best=fa_ndim([40 800 0.5 0.2 1 0 0 0]);
    str=['A' num2str(i) ':Z' num2str(i)];
    sheetname=['Firefly_ndim'];
    writematrix(best(1,:),filename,'Sheet',sheetname,'Range',str);
end

% hybrid approach
for m=0:5 % probability threshold
    for j=1:8, %divider
        %rand('state',0);  % Reset the random generator
        for i=1:100,
            best=fa_ndim([40 800 0.5 0.2 1 1 j m*0.1]);
            str=['A' num2str(i) ':Z' num2str(i)];
            sheetname=['Firefly_ndim_hybrid_' num2str(j) '_' num2str(m)];
            writematrix(best(1,:),filename,'Sheet',sheetname,'Range',str);
        end
    end
end

% hybrid using two point crossover operator
filename = 'testdata_ndim_2Point.xlsx'
for j=6:8, %divider
    for i=1:100,
            best=fa_ndim_2Point([40 800 0.5 0.2 1 1 j 0]);
            str=['A' num2str(i) ':Z' num2str(i)];
            sheetname=['Firefly_ndim_hybrid_' num2str(j) '_0'];
            writematrix(best(1,:),filename,'Sheet',sheetname,'Range',str);
    end
end

% hybrid using both offspring
filename = 'testdata_ndim_exp.xlsx'
for j=6:8, %divider
    for i=1:100, 
            best=fa_ndim_exp([40 800 0.5 0.2 1 1 j 0]);
            str=['A' num2str(i) ':Z' num2str(i)];
            sheetname=['Firefly_ndim_hybrid_' num2str(j) '_0'];
            writematrix(best(1,:),filename,'Sheet',sheetname,'Range',str);
    end
end

'The End'