% script to plot stress vs. strain data from all rheology experiments (excludes temperature change and microstructure evolution experiments, i.e. only constant temp experiments which reached teriary strain)

%% select only experiments which reached tertiary and didn't have a temperature change. {{{
strain_rates = readtable('~/experimental_data/strain_rates.csv');

changing_temp = contains(strain_rates.temperature, ',');
rheology_list = strain_rates(~changing_temp, :);
not_tertiary = isnan(rheology_list.tertiary_rate_1);
rheology_list = rheology_list(~not_tertiary, :);

%LC034 appears to be affected by large grain size relative to sample size, giving it a stupidly high strain rate. Excluding this to make the rest of the data clearer (comment these lines to keep it in)
%is28 = contains(rheology_list.experiment_number, '28');
%rheology_list = rheology_list(~is28, :);
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
main_line_width = 2.5;
dotted_line_width = 2;
dot_size = 10;

f1 = figure('Position', [200 200 1700 550]);
axis_limits = [0 0.2 6e-09 2.1e-7];

% standard ice {{{
standard_ax = subplot(1,3,1);
%hold on
		
% find the first instance of each temp (these need to be visible to the legend)
minus2_ind = find(standard_ice.temperature==-2);
first_minus2 = minus2_ind(1);
minus7_ind = find(standard_ice.temperature==-7);
first_minus7 = minus7_ind(1);
minus5_ind = find(standard_ice.temperature==-5);
first_minus5 = minus5_ind(1);
minus10_ind = find(standard_ice.temperature==-10);
first_minus10 = minus10_ind(1);

for i = 1:length(standard_ice.experiment_number)
	experiment_number = char(standard_ice.experiment_number(i));
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
	if isfile(filepath)
		data = readtable(filepath);
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
		if i==first_minus7 | i==first_minus2 | i==first_minus5 | i==first_minus10
			handle_visibility = 'on';
		else
			handle_visibility = 'off';
		end
		semilogy(data.smoothed_octahedral_strain, data.smoothed_octahedral_strain_rate, 'LineWidth', main_line_width, 'color', colour, 'HandleVisibility', handle_visibility);
		hold on
		%plot tertiary strain rates as dotted lines
		yline(standard_ice.tertiary_rate_1(i), '--', 'LineWidth', dotted_line_width, 'color', colour, 'HandleVisibility', 'off');
		%plot secondary minimum
%		plot(standard_ice.secondary_strain(i), standard_ice.secondary_rate(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'off');
	end
end
legend('$-2\,^{\circ}\mathrm{C}$', '$-5\,^{\circ}\mathrm{C}$', '$-7\,^{\circ}\mathrm{C}$', '$-10\,^{\circ}\mathrm{C}$')
xlabel('octahedral shear strain')
ylabel('octahedral shear strain rate')
title('\textbf{standard ice}')
grid on
axis(axis_limits)

%}}}
% meteoric ice {{{
meteoric_ax = subplot(1,3,2);
		
% find the first instance of each temp (these need to be visible to the legend)
minus7_ind = find(meteoric_ice.temperature==-7);
first_minus7 = minus7_ind(1);

for i = 1:length(meteoric_ice.experiment_number)
	experiment_number = char(meteoric_ice.experiment_number(i));
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
	if isfile(filepath)
		data = readtable(filepath);
		if meteoric_ice.temperature(i) == -7;
			colour = c_meteoric_7;
		elseif meteoric_ice.temperature(i) == -2;
			colour = c_meteoric_2;
		else colour = [0.5 0.5 0.5];
		end
		if i==first_minus7 
			handle_visibility = 'on';
		else
			handle_visibility = 'off';
		end
		semilogy(data.smoothed_octahedral_strain, data.smoothed_octahedral_strain_rate, 'LineWidth', main_line_width, 'color', colour, 'HandleVisibility', handle_visibility);
		hold on
		%plot tertiary strain rates as dotted lines
		yline(meteoric_ice.tertiary_rate_1(i), '--', 'LineWidth', dotted_line_width, 'color', colour, 'HandleVisibility', 'off');
		%plot secondary minimum
%		plot(meteoric_ice.secondary_strain(i), meteoric_ice.secondary_rate(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'off');
	end
end
legend('$-7\,^{\circ}\mathrm{C}$')
xlabel('octahedral shear strain')
ylabel('octahedral shear strain rate')
title('\textbf{meteoric ice}')
grid on
axis(axis_limits)
%}}}
% marine ice {{{
marine_ax = subplot(1,3,3);
		
% find the first instance of each temp (these need to be visible to the legend)
minus2_ind = find(marine_ice.temperature==-2);
first_minus2 = minus2_ind(1);
minus7_ind = find(marine_ice.temperature==-7);
first_minus7 = minus7_ind(1);

for i = 1:length(marine_ice.experiment_number)
	experiment_number = char(marine_ice.experiment_number(i));
	filepath = strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv');
	if isfile(filepath)
		data = readtable(filepath);
		if marine_ice.temperature(i) == -7;
			colour = c_marine_7;
		elseif marine_ice.temperature(i) == -2;
			colour = c_marine_2;
		else colour = [0.5 0.5 0.5];
		end
		if i==first_minus7 | i==first_minus2
			handle_visibility = 'on';
		else
			handle_visibility = 'off';
		end
		semilogy(data.smoothed_octahedral_strain, data.smoothed_octahedral_strain_rate, 'LineWidth', main_line_width, 'color', colour, 'HandleVisibility', handle_visibility);
		hold on
		%plot tertiary strain rates as dotted lines
		yline(marine_ice.tertiary_rate_1(i), '--', 'LineWidth', dotted_line_width, 'color', colour, 'HandleVisibility', 'off');
		%plot secondary minimum
%		plot(marine_ice.secondary_strain(i), marine_ice.secondary_rate(i), '.', 'MarkerSize', dot_size, 'color', colour, 'HandleVisibility', 'off');
	end
end
legend('$-2\,^{\circ}\mathrm{C}$', '$-7\,^{\circ}\mathrm{C}$')
xlabel('octahedral shear strain')
ylabel('octahedral shear strain rate')
title('\textbf{marine ice}')
grid on
axis(axis_limits)
%}}}


%% }}}

export_fig '~/experimental_data/figures/rheology_stress_strain_all' -png
