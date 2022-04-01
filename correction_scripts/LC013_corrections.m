function LC013_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;
%data = data;


%data.v_dis(142656:end) = data.v_dis(142656:end) + 0.008;

I = [8584 8640];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data


%data_corr = data; 
writetable(struct2table(data), output_file); 


end

