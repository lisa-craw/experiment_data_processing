function LC033_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(558) = data.v_dis(557);
data.v_dis(559) = data.v_dis(557);

I = [25595 25629];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [30656 30737];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 


%data.v_dis(96060:end) = data.v_dis(96060:end) + 1.3680;

%I = [95660 96060];
%p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
%data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data_corr = data; 
writetable(struct2table(data), output_file); 


end

