% function to import an EBSD or FA dataset, and plot grain sphericity vs grain size (see Fan et al.)
% test case:
% plot_sphericity_vs_gs('~/experimental_data/FA_data/LC017/LC017_FA_grain_data.csv', '~/experimental_data/FA_data/LC017/LC017', 'marine')
%input_path = '~/experimental_data/FA_data/LC017/LC017_FA_grain_data.csv'
%output_path = '~/experimental_data/FA_data/LC017/LC017'
%ice_type = 'marine'


function plot_sphericity_distribution(input_path, output_path, ice_type)
	afs = 14; % axis label font size
	ms = 20;
	grain_data = readtable(input_path);
	max_value = 0.5;
	trendline_colour = [0.9373 0.5137 0.3294]; % 'mandarin'
	if strcmp(ice_type, 'marine')==1
		colour = [0.2157 0.4431 0.5569];
	elseif strcmp(ice_type, 'standard')==1
		colour = [0.4431 0.2431 0.3529]+[0.1 0.1 0.1];
	elseif strcmp(ice_type, 'meteoric')==1
		colour = [0.2 0.6 0.3333];
	else
		colour = [0.3 0.3 0.3];
	end
	figure
	plot(grain_data.equivalent_diameter_microns, grain_data.sphericity, '.', 'MarkerSize', ms, 'color', colour);
	%scatter(grain_data.equivalent_diameter_microns, grain_data.sphericity, 30, grain_data.long_axis_orientation_deg_from_compression, 'filled');
	% add trendline
	p = polyfit(grain_data.equivalent_diameter_microns, grain_data.sphericity, 1);
	fit = polyval(p, grain_data.equivalent_diameter_microns);
	hold on
	%plot([grain_data.equivalent_diameter_microns(1) grain_data.equivalent_diameter_microns(end)], [fit(1) fit(end)], 'LineWidth', 2, '--', 'color', colour);
	%plot(grain_data.equivalent_diameter_microns, fit, 'LineWidth', 2, '--', 'color', colour)
	[minimum, minimum_ind] = min(grain_data.equivalent_diameter_microns);
	[maximum, maximum_ind] = max(grain_data.equivalent_diameter_microns);
	plot([minimum maximum], [fit(minimum_ind) fit(maximum_ind)],'--', 'LineWidth', 2, 'color', trendline_colour) 
	axis([0 6000 0 0.5]);
	xlabel('grain sphericity, $\psi$','Interpreter', 'latex', 'fontsize',afs)
	ylabel('grain size, $\mu$m','Interpreter', 'latex', 'fontsize',afs)
	export_fig(strcat(output_path, '_sphericity_vs_gs'), '-png')
	export_fig(strcat(output_path, '_sphericity_vs_gs'), '-pdf')
end
