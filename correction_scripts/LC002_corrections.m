function LC002_corrections(input_file, output_file)

tmp = readtable(input_file);
% easier to deal with this as a structure array
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

n=3426;

I = [1096+n 1198+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(17694+n:end) = data.v_dis(17694+n:end) - 0.002;

I = [17622+n 17694+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(18591+n:end) = data.v_dis(18591+n:end) - 0.0035;

I = [18434+n 18606+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [25653+n 25785+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [30800+n 30868+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(35315+n:end) = data.v_dis(35315+n:end) - 0.01;

I = [35227+n 35328+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(52359+n:end) = data.v_dis(52359+n:end) - 0.006;

I = [52236+n 52359+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(56243+n:end) = data.v_dis(56243+n:end) - 0.007;

I = [56200+n 56243+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(61265+n:end) = data.v_dis(61265+n:end) - 0.005;

I = [60816+n 61265+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [77700+n 77850+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(81942+n:end) = data.v_dis(81942+n:end) + 0.001;

I = [81840+n 81942+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [86280+n 86560+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(90538+n:end) = data.v_dis(90538+n:end) - 0.006;

I = [90445+n 90538+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(91059+n:end) = data.v_dis(91059+n:end) - 0.007;

I = [91010+n 91059+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(4614+n:end) = data.v_dis(4614+n:end) - 0.005;

I = [4129+n 4614+n];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis = data.v_dis(3404:end);
data.h_dis = data.h_dis(3404:end);
data.time = data.time(3404:end);
data.temp = data.temp(3404:end);

data_corr = data; 
writetable(struct2table(data), output_file); 

end

