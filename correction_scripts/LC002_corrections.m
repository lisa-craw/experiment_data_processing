function LC002_corrections(input_file, output_file)

tmp = readtable(input_file);
% easier to deal with this as a structure array
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

data.v_dis(3708:end) = data.v_dis(3708:end) + 0.207;

I = [3121 3708];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

first_bit = data.v_dis(1:3407);
data.v_dis = data.v_dis(3407:end);

%blank = linspace(1, 3407, 3407);
%blank = blank';
%data.v_dis = vertcat(blank, data.v_dis);

I = [129 200];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [410 550];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

%data.v_dis(12226:end) = data.v_dis(12226:end) - 0.01;

I = [1096 1198];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(17694:end) = data.v_dis(17694:end) - 0.002;

I = [17622 17694];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(18591:end) = data.v_dis(18591:end) - 0.0035;

I = [18434 18606];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [25703 25785];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [30800 30868];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(35315:end) = data.v_dis(35315:end) - 0.01;

I = [35227 35328];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(52359:end) = data.v_dis(52359:end) - 0.006;

I = [52236 52359];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(56243:end) = data.v_dis(56243:end) - 0.007;

I = [56200 56243];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(61265:end) = data.v_dis(61265:end) - 0.005;

I = [60816 61265];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [77700 77850];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(81942:end) = data.v_dis(81942:end) + 0.001;

I = [81840 81942];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

I = [86280 86560];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(90538:end) = data.v_dis(90538:end) - 0.006;

I = [90445 90538];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(91059:end) = data.v_dis(91059:end) - 0.007;

I = [91010 91059];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 

data.v_dis(4614:end) = data.v_dis(4614:end) - 0.005;

I = [4129 4614];
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1);
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); 


data.v_dis = vertcat(first_bit, data.v_dis);
data.v_dis = data.v_dis(2:end);
%data.v_dis = data.v_dis(3407:end);

%data_corr = data; 
writetable(struct2table(data), output_file); 

end

