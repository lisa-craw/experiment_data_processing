function LC020_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(96270:end) = data.v_dis(96270:end) + 0.8;

I = [95630 96270];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data.v_dis = data.v_dis(12899:end);
%data.time = data.time(12899:end);
%data.time = data.time - data.time(1);
%data.temp = data.temp(12899:end);

I = [82732 95818];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(1989805:end) = data.v_dis(1989805:end) + 0.009;

I = [198803 198981];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [208853 208992];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [213246 213489];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis = data.v_dis(1:216819);
data.time = data.time(1:216819);
data.temp = data.temp(1:216819);

%data_corr = data; 
writetable(struct2table(data), output_file); 

end

