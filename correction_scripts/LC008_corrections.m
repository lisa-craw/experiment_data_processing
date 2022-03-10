function LC008_corrections(input_file, output_file) 

tmp = readtable(input_file); 
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

I = [11437 11440];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [30565 31311];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [46514 46605];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [47697 48166];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

data.v_dis(48785:end) = data.v_dis(48785:end) - 0.008;

I = [48713 48785];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [49830 50173];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [55020 56613];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [58285 58782];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [64693 64719];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

I = [72020 72343];% data range
p = polyfit(I,[data.v_dis(I(1)) data.v_dis(I(2))],1); % linear fit
data.v_dis(I(1):I(2)) = polyval(p,I(1):I(2)); % replace data

%data_corr = data; 
writetable(struct2table(data), output_file); 

end

