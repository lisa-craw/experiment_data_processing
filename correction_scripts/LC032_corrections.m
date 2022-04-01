function LC032_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

I = [1 9];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(21837:end) = data.v_dis(21837:end) - 0.004; 

I = [21502 21837];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(24513:end) = data.v_dis(24513:end) - 0.009; 

I = [24409 24513];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(28907:end) = data.v_dis(28907:end) + 0.009; 

I = [28806 28907];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [25304 25432];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(41836:end) = data.v_dis(41836:end) + 0.0036; 

I = [41765 41946];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(12565:end) = data.v_dis(12565:end) + 0.0025; 

I = [12565-100 12565];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data.v_dis = data.v_dis(9:end);
%data.h_dis = data.h_dis(9:end);
%data.time = data.time(9:end);
%data.temp = data.temp(9:end);



%data_corr = data; 
writetable(struct2table(data), output_file); 


end

