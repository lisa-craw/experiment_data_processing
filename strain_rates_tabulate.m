% function to iterate through a list of experiments, and add secondary and tertiary strain rates to a table based on user-selected points

experiment_list = readtable('~/experimental_data/strain_rates.csv');

%list of experiments we wish to calculate strain rates for (so we don't have to do them all every time)
target_experiments = [1 2 3 4]' ;

for i=1:length(target_experiments)
	experiment_number = char(experiment_list.experiment_number(i));
	if isfile(strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv'))
		[secondary_rate, secondary_strain, tertiary_rate, tertiary_strain] = get_strain_rate(experiment_number)
		experiment_list.secondary_rate(i) = secondary_rate;
		experiment_list.secondary_strain(i) = secondary_strain;
		experiment_list.tertiary_rate(i) = tertiary_rate;
		experiment_list.tertiary_strain(i) = tertiary_strain;
	else
	end
end

writetable(experiment_list, '~/experimental_data/strain_rates_test.csv')
