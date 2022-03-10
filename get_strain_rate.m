% function which plots strain rates throughout an experiment, and takes user input to help calculate secondary and tertiary strain rates.
%input: experiment number as a string

function [secondary_rate, secondary_strain, tertiary_rate, tertiary_strain] = get_strain_rate(experiment_number)
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');

		table = readtable(filepath);
		rate = table.smoothed_octahedral_strain_rate;
		strain = table.smoothed_octahedral_strain;
		plot(rate)
		disp('select the secondary minimum')
		[sec_x, sec_y] = ginput(1);
		secondary_rate = sec_y;
		secondary_strain = strain(floor(sec_x));
	
		disp('select the start and end of the tertiary rate')
		%this is to exclude the "drop-off zone" at the end of some experiments
		[tert_x, tert_y] = ginput(2);
		tert_x = floor(tert_x);
		tert_y = floor(tert_y);
		tertiary_rate = mean(rate(tert_x(1):tert_x(2)));
		tertiary_strain = mean(strain(tert_x(1):tert_x(2)));
end
