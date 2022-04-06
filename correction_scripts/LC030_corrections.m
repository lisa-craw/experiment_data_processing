function LC030_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;


data.v_dis(91212-567:end) = data.v_dis(91212-567:end) + 4.97;

I = [90300-567 91400-567];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(43430-567:end) = data.v_dis(43430-567:end) - 0.004;

I = [43430-500-567 43430-567];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 


%data_corr = data; 
writetable(struct2table(data), output_file); 


end

