function LC023_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(16958:end) = data.v_dis(16958:end) + 0.01;

I = [16063 16958];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(133575:end) = data.v_dis(133575:end) - 0.006;

I = [133168 133575];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(229131:end) = data.v_dis(229131:end) - 0.004;

I = [228967 229131];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(254567:end) = data.v_dis(254567:end) - 0.004;

I = [254011 254567];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data_corr = data; 
writetable(struct2table(data), output_file); 


end

