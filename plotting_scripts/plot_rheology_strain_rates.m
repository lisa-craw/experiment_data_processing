% script to plot secondary and tertiary strain rate data for all standard, marine and meteoric experiments which reached tertiary creep at a constant temperature.

%% select only experiments which reached tertiary and didn't have a temperature change. {{{
strain_rates = readtable('~/experimental_data/strain_rates.csv');

changing_temp = contains(strain_rates.temperature, ',');
rheology_list = strain_rates(~changing_temp, :);
not_tertiary = isnan(rheology_list.tertiary_rate_1);
rheology_list = rheology_list(~not_tertiary, :);
%%}}}

% separate out marine, meteoric and standard ice {{{
% sort by temperature to make legend labels easier
is_standard = strcmp(rheology_list.ice_type, 'standard');
standard_ice = rheology_list(is_standard, :);
standard_ice.temperature = str2double(standard_ice.temperature);
standard_ice = sortrows(standard_ice, 'temperature', 'descend');
is_marine = strcmp(rheology_list.ice_type, 'marine');
marine_ice = rheology_list(is_marine, :);
marine_ice.temperature = str2double(marine_ice.temperature);
marine_ice = sortrows(marine_ice, 'temperature', 'descend');
is_meteoric = strcmp(rheology_list.ice_type, 'meteoric');
meteoric_ice = rheology_list(is_meteoric, :);
meteoric_ice.temperature = str2double(meteoric_ice.temperature);
meteoric_ice = sortrows(meteoric_ice, 'temperature', 'descend');

%}}}

%% set colours {{{

shade = 0.15; % amount by which to adjust colours for different temperatures

%purple for standard ice
c_standard_7 = [0.4431 0.2431 0.3529];
c_standard_10 = c_standard_7 - 0.5*[shade shade shade];
c_standard_5 = c_standard_7 + [shade shade shade];
c_standard_2 = c_standard_7 + 2*[shade shade shade];

%blue for meteoric ice
c_meteoric_7 = [0.2157 0.4431 0.5569];
c_meteoric_2 = c_meteoric_7 + [shade shade shade];
% alternative teal blue: [0 0.9412 0.7098];

%green for marine ice
c_marine_7 = [0.2 0.6 0.3333];
c_marine_2 = c_marine_7 + [shade shade shade];

% a cool orange if needed: [0.9804 0.5098 0.2980]

grey = [0.4 0.4 0.4];
%% }}}

%% plot all three datasets {{{
circle_size = 12; 
dot_size = 45; 

f1 = figure('Position', [100 100 1800 450]);
axis_limits = [-11 -1 0 1.5e-7];

% standard ice {{{
standard_ax = subplot(1,3,1);
hold on
		
for i = 1:length(standard_ice.experiment_number)
	experiment_number = char(standard_ice.experiment_number(i));
		if standard_ice.temperature(i) == -7;
			colour = c_standard_7;
		elseif standard_ice.temperature(i) == -2;
			colour = c_standard_2;
		elseif standard_ice.temperature(i) == -5;
			colour = c_standard_5;
		elseif standard_ice.temperature(i) == -10;
			colour = c_standard_10;
		else colour = [0.5 0.5 0.5];
		end
		%plot secondary strain rate
		%plot tertiary strain rate
		plot(standard_ice.temperature(i), standard_ice.secondary_rate(i), 'o', 'MarkerSize', circle_size, 'color', colour, 'HandleVisibility', 'on');
		plot(standard_ice.temperature(i), standard_ice.tertiary_rate_1(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'on');
	end
%axis(axis_limits)
legend('secondary', 'tertiary', 'Location', 'northwest')
ylabel('octahedral shear strain rate (s$^{-1}$)')
xlabel('temperature ($^{\circ}\mathrm{C}$)')
title('\textbf{standard ice}')
axis(axis_limits)
grid on

%}}}
% meteoric ice {{{
meteoric_ax = subplot(1,3,2);
hold on
		
for i = 1:length(meteoric_ice.experiment_number)
	experiment_number = char(meteoric_ice.experiment_number(i));
		if meteoric_ice.temperature(i) == -7;
			colour = c_meteoric_7;
		else colour = [0.5 0.5 0.5];
		end
		%plot secondary strain rate
		%plot tertiary strain rate
		plot(meteoric_ice.temperature(i), meteoric_ice.secondary_rate(i), 'o', 'MarkerSize', circle_size, 'color', colour, 'HandleVisibility', 'on');
		plot(meteoric_ice.temperature(i), meteoric_ice.tertiary_rate_1(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'on');
	end
%axis(axis_limits)
legend('secondary', 'tertiary', 'Location', 'northwest')
ylabel('octahedral shear strain rate (s$^{-1}$)')
xlabel('temperature ($^{\circ}\mathrm{C}$)')
title('\textbf{meteoric ice}')
axis(axis_limits)
grid on

%}}}
% marine ice {{{
marine_ax = subplot(1,3,3);
hold on
		
for i = 1:length(marine_ice.experiment_number)
	experiment_number = char(marine_ice.experiment_number(i));
		if marine_ice.temperature(i) == -7;
			colour = c_marine_7;
		elseif marine_ice.temperature(i) == -2;
			colour = c_marine_2;
		else colour = [0.5 0.5 0.5];
		end
		%plot secondary strain rate
		%plot tertiary strain rate
		plot(marine_ice.temperature(i), marine_ice.secondary_rate(i), 'o', 'MarkerSize', circle_size, 'color', colour, 'HandleVisibility', 'on');
		plot(marine_ice.temperature(i), marine_ice.tertiary_rate_1(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'on');
	end
%axis(axis_limits)
legend('secondary', 'tertiary', 'Location', 'northwest')
ylabel('octahedral shear strain rate (s$^{-1}$)')
xlabel('temperature ($^{\circ}\mathrm{C}$)')
title('\textbf{marine ice}')
axis(axis_limits)
grid on

%}}}

export_fig '~/experimental_data/figures/rheology_rates_vs_temp_all' -png
