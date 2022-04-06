% script to plot stress vs. strain data from all rheology experiments (excludes temperature change and microstructure evolution experiments, i.e. only constant temp experiments which reached teriary strain)

%% select only experiments which reached tertiary and didn't have a temperature change. Also remove -10 and -5 experiments, as they aren't relevant here {{{
strain_rates = readtable('~/experimental_data/strain_rates.csv');

changing_temp = contains(strain_rates.temperature, ',');
rheology_list = strain_rates(~changing_temp, :);
not_tertiary = isnan(rheology_list.tertiary_rate_1);
rheology_list = rheology_list(~not_tertiary, :);
minus_10 = str2double(rheology_list.temperature)==-10;
rheology_list = rheology_list(~minus_10, :);
%%}}}

% separate out marine, meteoric and standard ice {{{ 
is_standard = strcmp(rheology_list.ice_type, 'standard');
standard_ice = rheology_list(is_standard, :);
is_marine = strcmp(rheology_list.ice_type, 'marine');
marine_ice = rheology_list(is_marine, :);
is_meteoric = strcmp(rheology_list.ice_type, 'meteoric');
meteoric_ice = rheology_list(is_meteoric, :);

%}}}

%% set colours {{{

%purple for standard ice
shade = 0.1;
c_standard_7 = [0.4431 0.2431 0.3529];
c_standard_2 = c_standard_7 + [shade shade shade];

%blue for meteoric ice
c_meteoric_7 = [0.2157 0.4431 0.5569];
c_meteoric_2 = c_meteoric_7 + [shade shade shade];
% alternative teal blue: [0 0.9412 0.7098];

%green for marine ice
c_marine_7 = [0.2 0.6 0.3333];
c_marine_2 = c_marine_7 + [shade shade shade];

% a cool orange if needed: [0.9804 0.5098 0.2980]

grey = [0.4 0.4 0.4];
%% 

%% plot all three datasets {{{
main_line_width = 2;
dotted_line_width = 1.5;
dot_size = 10;

f1 = figure('Position', [200 200 1200 550]);
standard_ax = subplot(1,3,1);
hold on
		
% find the first instance of each temp (these need to be visible to the legend)
minus2_ind = find(str2double(standard_ice.temperature)==-2);
first_minus2 = minus2_ind(1);
minus7_ind = find(str2double(standard_ice.temperature)==-7);
first_minus7 = minus7_ind(1);

% QUICK CHEAT, FIX THIS LATER
first_minus7 = 4; 

for i = 1:length(standard_ice.experiment_number)
	experiment_number = char(standard_ice.experiment_number(i));
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
	if isfile(filepath)
		data = readtable(filepath);
		if str2double(standard_ice.temperature{i}) == -7;
			colour = c_standard_7;
		elseif str2double(standard_ice.temperature{i}) == -2;
			colour = c_standard_2;
		else colour = [0.5 0.5 0.5]
		end
		if i==first_minus7 | i==first_minus2
			handle_visibility = 'on';
		else
			handle_visibility = 'off';
		end
		%}}}
		plot(data.smoothed_octahedral_strain, data.smoothed_octahedral_strain_rate, 'LineWidth', main_line_width, 'color', colour, 'HandleVisibility', handle_visibility);
		%plot tertiary strain rates as dotted lines
		yline(standard_ice.tertiary_rate_1(i), '--', 'LineWidth', dotted_line_width, 'color', grey, 'HandleVisibility', 'off');
		%plot secondary minimum
		plot(standard_ice.secondary_strain(i), standard_ice.secondary_rate(i), '.', 'MarkerSize', dot_size, 'color', grey, 'HandleVisibility', 'off');
	end
end

legend('$-2\,^{\circ}\mathrm{C}$', '$-7\,^{\circ}\mathrm{C}$');



%% }}}

