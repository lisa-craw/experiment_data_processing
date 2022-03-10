function LC004_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(90216:90217) = data.v_dis(90215);
data.v_dis(90220:90221) = data.v_dis(90219);

data.v_dis(148335:end) = data.v_dis(148335:end) - 0.03;

I = [148311 148335];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [148281 148347];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data


data.v_dis(176576) = data.v_dis(176576) - 0.015;

data.v_dis(176740:end) = data.v_dis(176740:end) - 0.01;

data.v_dis(210904:end) = data.v_dis(210904:end) - 0.007;

data.v_dis(236788:end) = data.v_dis(236788:end) - 0.006;

data.v_dis(344660) = data.v_dis(344659);

data.v_dis(344662:end) = data.v_dis(344662:end) - 0.018;

data.v_dis(78893:78894) = data.v_dis(78892);

data.v_dis(29704:end) = data.v_dis(29704:end) - 0.009;

I = [148312 148329];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(176576:176578) = data.v_dis(176574);

data.v_dis(176658:end) = data.v_dis(176658:end) + 0.01;

data.v_dis(176671:end) = data.v_dis(176671:end) - 0.001;

I = [176578 176671];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [210880 211234];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data
I = [211184 210974];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(236773) = data.v_dis(236772);

data.v_dis(236786) = data.v_dis(236785);

data.v_dis(277053:end) = data.v_dis(277053:end) - 0.02;

I = [277019 277053];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(29728:end) = data.v_dis(29728:end) - 0.003;

I = [29701 29728];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(60171:60172) = data.v_dis(60170);

data.v_dis(60173:end) = data.v_dis(60173:end) + 0.006;

data.v_dis(60503:end) = data.v_dis(60503:end) + 0.005;

I = [60112 60504];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data
data.v_dis(124683:124684) = data.v_dis(124682);

data.v_dis(124685:end) = data.v_dis(124685:end) - 0.003;

data.v_dis(131119) = data.v_dis(131118);

data.v_dis(131122:end) = data.v_dis(131122:end) - 0.003;

I = [276992 277053];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(302793:end) = data.v_dis(302793:end) + 0.013;

I = [302623 302794];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(345072:end) = data.v_dis(345072:end) - 0.010;

I = [344631 345072];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(374891:end) = data.v_dis(374891:end) - 0.01;

I = [12688 14030];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [17180 17413];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(148400:end) = data.v_dis(148400:end) - 0.005;

I = [148280 148400];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [272519 272593];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [176497 176763];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(149320:end) = data.v_dis(149320:end) - 0.022;

I = [148176 149320];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(277358:end) = data.v_dis(277358:end) - 0.011;

I = [276859 277358];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(345095:end) = data.v_dis(345095:end) - 0.013;

I = [344463 345095];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(14031:end) = data.v_dis(14031:end) - 0.015;

I = [12402 14031];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(30250:end) = data.v_dis(30250:end) - 0.007;

I = [29350 30250];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(60817:end) = data.v_dis(60817:end) + 0.002;

I = [58966 61015];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(131265:end) = data.v_dis(131265:end) - 0.004;

I = [131013 131265];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(211320:end) = data.v_dis(211320:end) - 0.007;

I = [210810 211320];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(237165:end) = data.v_dis(237165:end) - 0.005;

I = [236675 237165];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

%data_corr = data; 
writetable(struct2table(data), output_file); 

end

