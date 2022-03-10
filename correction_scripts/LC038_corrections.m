function LC038_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

I = [10202 12641];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(13556:end) = data.v_dis(13556:end) - 0.02; 

%data_corr = data; 
writetable(struct2table(data), output_file); 


end

