% function to iterate through a list of experiments, and add secondary and tertiary strain rates to a table based on user-selected points

%if this is the first time, we take the data from the experiment parameters table. If we've run this before, we will load the output table from last time, so that we can add data for any experiment at any time 
if isfile('~/experimental_data/strain_rates.csv')
	experiment_list = readtable('~/experimental_data/strain_rates.csv');
else
	experiment_list = readtable('~/experimental_data/experiment_parameters.csv');
end

%list of experiments we wish to calculate strain rates for (so we don't have to do them all every time)
target_experiments = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45]';

for i=1:length(target_experiments)
	experiment_number = target_experiments(i);
	experiment_name = char(experiment_list.experiment_number(experiment_number));
	if isfile(strcat('~/experimental_data/', experiment_name, '/', experiment_name, '_smoothed.csv'))
		[secondary_rate, secondary_strain, tertiary_rate_1, tertiary_strain_1, tertiary_rate_2, tertiary_strain_2] = get_strain_rate(experiment_name)
		experiment_list.secondary_rate(experiment_number) = round(secondary_rate, 4, 'significant');
		experiment_list.secondary_strain(experiment_number) = round(secondary_strain, 4, 'significant');
		experiment_list.tertiary_rate_1(experiment_number) = round(tertiary_rate_1, 4, 'significant');
		experiment_list.tertiary_strain_1(experiment_number) = round(tertiary_strain_1, 4, 'significant');
		experiment_list.tertiary_rate_2(experiment_number) = round(tertiary_rate_2, 4, 'significant');
		experiment_list.tertiary_strain_2(experiment_number) = round(tertiary_strain_2, 4, 'significant');
	else
	end
end

writetable(experiment_list, '~/experimental_data/strain_rates.csv')
