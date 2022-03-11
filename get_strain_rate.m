% function which plots strain rates throughout an experiment, and takes user input to help calculate secondary and tertiary strain rates.
%input: experiment number as a string

function [secondary_rate, secondary_strain, tertiary_rate_1, tertiary_strain_1, tertiary_rate_2, tertiary_strain_2] = get_strain_rate(experiment_number)
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
	index = str2double(extractAfter(experiment_number, 'LC0'));
	experiment_list = readtable('~/experimental_data/experiment_parameters.csv');
	temp = experiment_list.temperature(index);
		table = readtable(filepath);
		rate = table.smoothed_octahedral_strain_rate;
		strain = table.smoothed_octahedral_strain;
		semilogy(rate)
		axis([0 length(rate)*1.5 min(rate)*0.8 max(rate)*1.7])
		hold on
		title(experiment_number)
		text((length(rate)/2), max(rate)*1.2, ['no secondary minimum?' char(10) 'click here'], 'HorizontalAlignment', 'center'); 
		text((length(rate)*1.3), (max(rate)-min(rate))/1.5, ['no steady tertiary rate?' char(10) 'click here'], 'HorizontalAlignment', 'center'); 
		disp('select the secondary minimum')
		[sec_x, sec_y] = ginput(1);
		if sec_y<=max(rate)
			secondary_rate = sec_y;
			secondary_strain = strain(floor(sec_x));
		else 
			secondary_rate = NaN;
			secondary_strain = NaN;
		end
				
		disp('select the start and end of the first tertiary rate')
		%this is to exclude the "drop-off zone" at the end of some experiments
		[tert_1_x, tert_1_y] = ginput(2);
		tert_1_x = floor(tert_1_x);
		tert_1_y = floor(tert_1_y);
		if tert_1_x<=length(rate)
			tertiary_rate_1 = mean(rate(tert_1_x(1):tert_1_x(2)));
			tertiary_strain_1 = strain(tert_1_x(1));
		else
			tertiary_rate_1 = NaN;
			tertiary_strain_1 = NaN;
		end
		if contains(char(temp), ',')
			disp('select the start and end of the second tertiary rate')
			%this is to exclude the "drop-off zone" at the end of some experiments
			[tert_2_x, tert_2_y] = ginput(2);
			tert_2_x = floor(tert_2_x);
			tert_2_y = floor(tert_2_y);
			tertiary_rate_2 = mean(rate(tert_2_x(1):tert_2_x(2)));
			tertiary_strain_2 = strain(tert_2_x(1));
		else
			tertiary_rate_2 = NaN;
			tertiary_strain_2 = NaN;
		end
		clf	
end
