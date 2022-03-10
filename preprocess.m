% function to preprocess experimental data by removing obvious systematic errors.
% test: experiment_number = 'LC001'; sp = 532; ep = 91002;

function preprocess(experiment_number, sp, ep)

tmp = readtable(strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_raw_data.csv'));
% easier to deal with this as a structure array
data.v_dis = tmp.v_dis;
data.h_dis = tmp.v_dis;
data.time = tmp.time;
data.temp = tmp.temp;

% make all values positive (in case dial gauge was in reverse)
if mean(data.v_dis)<0
	data.v_dis = data.v_dis*(-1)
end


step = 0.05;            % replace obvious error values
i_err_v = find(abs(diff(data.v_dis)) > step);
LIM = 25;
i_err_v = i_err_v(i_err_v > LIM);
data.v_dis(i_err_v +1) = data.v_dis(i_err_v-1);

[i_err_T,~] = find(data.temp == -273.15); % remove temperature errors
data.time = data.time(sp:ep);   %remove rubbish at the start
data.temp = data.temp(sp:ep);
data.h_dis = data.h_dis(sp:ep);
data.v_dis = data.v_dis(sp:ep);

lim = 150;            % remove errors from "sticky" gauges
D = diff([0;diff(data.v_dis)==0;0]);
i_f = find(D>0);
i_l = find(D<0) + 1;
range = 1 + find(D<0) - find(D>0);
ind = [i_f(range>lim) i_l(range>lim)];% data range
n = size(ind,1);
for i = 1:n
    p = polyfit(ind(i,:),[data.v_dis(ind(i,1)) data.v_dis(ind(i,2))],1);
	% replace the data with the linear fit between the endpoints.
	data.v_dis(ind(i,1):ind(i,2)) = polyval(p,ind(i,1):ind(i,2)); % replace data
end

writetable(struct2table(data), strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_preprocessed.csv'));
end
