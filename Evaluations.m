% ======================================================== % 
% Evaluations calculates the average of a run, and selects %
% the best and worst solution, and writes the collected    %
% data to a new Excel File                                 %
% ======================================================== %  
title=strings([1,60])
means=zeros(1,60);
maxima=zeros(1,60);
minima=zeros(1,60);

T = readtable('testdata_ndim.xlsx','PreserveVariableNames',false,'Sheet','Firefly_ndim','Range','P1:P100');
A = table2array(T);
title(1)=['FA']
means(1)=mean(A,'all');
maxima(1)=max(A);
minima(1)=min(A);

m=2;
for k=0:5,   
    for i=1:8,
        sheetname=['Firefly_ndim_hybrid_' num2str(i) '_' num2str(k)];
        T = readtable('testdata_ndim.xlsx','PreserveVariableNames',true,'Sheet',sheetname,'Range','P1:P100');
        A = table2array(T);
        av=mean(A,'all');
        title(m)=['FA_' num2str(i) '_' num2str(k)];
        means(m)=av;
        maxima(m)=max(A);
        minima(m)=min(A);
        m=m+1;
    end
end

for j=6:8,
    sheetname=['Firefly_ndim_hybrid_' num2str(j) '_0'];
    T = readtable('testdata_ndim_2Point.xlsx','PreserveVariableNames',false,'Sheet',sheetname,'Range','P1:P100');
    A = table2array(T);
    title(m)=['FA_two_point' num2str(j) '_0'];
    means(m)=mean(A,'all');
    maxima(m)=max(A);
    minima(m)=min(A);
    m=m+1;
end

for j=6:8,
    sheetname=['Firefly_ndim_hybrid_' num2str(j) '_0'];
    T1 = readtable('testdata_ndim_exp.xlsx','PreserveVariableNames',false,'Sheet',sheetname,'Range','P1:P100'); 
    A = table2array(T1);
    title(m)=['FA_exp' num2str(j) '_0'];
    means(m)=mean(A,'all');
    maxima(m)=max(A);
    minima(m)=min(A);
    m=m+1;
end

filename='Eval_1.xlsx';
writematrix(title,filename,'Range','B1:BD1');
writematrix(means,filename,'Range','B2:BD2');
writematrix(maxima,filename,'Range','B3:BD3');
writematrix(minima,filename,'Range','B4:BD4');