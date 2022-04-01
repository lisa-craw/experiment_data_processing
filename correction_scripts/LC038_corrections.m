function LC038_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

I = [10202 12641];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(13553:end) = data.v_dis(13553:end) - 0.02; 

I = [13537 13606];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(16879:end) = data.v_dis(16879:end) - 0.004; 

I = [16879-200 16879];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(25300:end) = data.v_dis(25300:end) - 0.015; 

I = [25300-200 25300];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(42521:end) = data.v_dis(42521:end) - 0.0230; 

I = [42521-200 42521];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(56402:end) = data.v_dis(56402:end) - 0.015; 

I = [56402-200 56402];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis = vertcat(data.v_dis(1:10202), data.v_dis(12780:end));
data.h_dis = vertcat(data.h_dis(1:10202), data.h_dis(12780:end));
data.time = vertcat(data.time(1:10202), data.time(12780:end));
data.temp = vertcat(data.temp(1:10202), data.temp(12780:end));

data.v_dis(10203:end) = data.v_dis(10203:end) - 0.2480; 


%data_corr = data; 
writetable(struct2table(data), output_file); 


end

