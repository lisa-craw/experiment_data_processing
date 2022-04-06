function LC003_corrections(input_file, output_file)

tmp = readtable(input_file);
% easier to deal with this as a structure array
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

I = [65580-1 65581+1];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(39555:end) = data.v_dis(39555:end) - 0.004;

I = [39555-600 39555];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(79950:end) = data.v_dis(79950:end) - 0.015;

I = [77400 79950];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(149163:end) = data.v_dis(149163:end) - 0.015;

I = [148600 149163];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(194590:end) = data.v_dis(194590:end) - 0.008;

I = [193950 194590];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(228990:end) = data.v_dis(228990:end) - 0.007;

I = [228500 228990];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(254805:end) = data.v_dis(254805:end) - 0.014;

I = [254400 254805];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(295360:end) = data.v_dis(295360:end) - 0.028;

I = [294600 295360];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(393230:end) = data.v_dis(393230:end) - 0.022;

I = [392500 393230];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(410400:end) = data.v_dis(410400:end) - 0.026;

I = [409800 410400];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data_corr = data; 
writetable(struct2table(data), output_file); 

end

