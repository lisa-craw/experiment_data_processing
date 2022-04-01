function LC001_corrections(input_file, output_file)

tmp = readtable(input_file);
% easier to deal with this as a structure array
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(12226:end) = data.v_dis(12226:end) - 0.01;

I = [11892 12226];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(29477:end) = data.v_dis(29477:end) - 0.013;

I = [29322 29477];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(42606:end) = data.v_dis(42606:end) - 0.007;

I = [42490 42606];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(46851:end) = data.v_dis(46851:end) - 0.008;

I = [46720 46851];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(51031:end) = data.v_dis(51031:end) + 0.006;

I = [50966 51031];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(55260:end) = data.v_dis(55260:end) - 0.015;

I = [55094 55260];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(59887:end) = data.v_dis(59887:end) + 0.035;

I = [59361 59887];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(73850:end) = data.v_dis(73850:end) - 0.04;

I = [73535 73850];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2));

data.v_dis(43466) = data.v_dis(43465);

data_corr = data;
writetable(struct2table(data), output_file);

end

