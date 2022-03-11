% function which plots strain rates throughout an experiment, and takes user input to help calculate secondary and tertiary strain rates.
%input: experiment number as a string

function [secondary_rate, secondary_strain, tertiary_rate, tertiary_strain] = get_strain_rate(experiment_number)
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
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
				
		disp('select the start and end of the tertiary rate')
		%this is to exclude the "drop-off zone" at the end of some experiments
		[tert_x, tert_y] = ginput(2);
		tert_x = floor(tert_x);
		tert_y = floor(tert_y);
		clf	
		if tert_x<=length(rate)
			tertiary_rate = mean(rate(tert_x(1):tert_x(2)));
			tertiary_strain = mean(strain(tert_x(1):tert_x(2)));
		else
			tertiary_rate = NaN;
			tertiary_strain = NaN;
		end
end
