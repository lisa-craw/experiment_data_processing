function LC016_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;
%data.v_dis = data.v_dis(205:end);

I = [135 217];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(13288:end) = data.v_dis(13288:end) - 0.01;

I = [12865 13332];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(29953:end) = data.v_dis(29953:end) - 0.0130;

I = [29510 29953];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(35130:end) = data.v_dis(35130:end) - 0.003;

I = [35010 35130];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(42756:end) = data.v_dis(42756:end) - 0.009;

I = [42440 42756];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data.v_dis(42756:end) = data.v_dis(42756:end) - 0.018;

%I = [42440 42756];
%p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
%data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(60285:end) = data.v_dis(60285:end) - 0.026;

I = [59925 60570];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(73025:end) = data.v_dis(73025:end) - 0.014;

I = [72750 73550];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(94530:end) = data.v_dis(94530:end) - 0.019;

I = [94320 94690];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(108416:end) = data.v_dis(108416:end) - 0.009;

I = [108215 108416];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(108416:end) = data.v_dis(108416:end) - 0.009;

I = [108215 108416];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(120714:end) = data.v_dis(120714:end) - 0.0150;

I = [120475 120714];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data_corr = data; 
writetable(struct2table(data), output_file); 

end

