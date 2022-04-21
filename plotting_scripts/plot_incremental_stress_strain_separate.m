% script to plot stress vs. strain for all experiments in the incremental strain series (experiments performed under the same conditions, but stopped at increasing strains to examine microstructural evolution)

%directory containing microstructure data
mech_data_directory = '~/experimental_data/';
micro_data_directory = '~/experimental_data/microstructure_data/';

all_data = readtable(strcat(mech_data_directory, '/all_data.csv'));

% list numbers of all of the target experiments
standard_incremental = [13 8 9 2];
%standard_incremental = [9 8 29 13];

marine_incremental = [35 36 32 17];
%marine_incremental = [17 32 36 35];

% set colors {{{
c_standard = [0.4431 0.2431 0.3529]-[0.2 0.2 0.2];
%c_marine = [0.2 0.6 0.3333];
c_marine = [0.2157 0.4431 0.5569]-[0.2 0.2 0.2];
shade = 0.1;
%}}}

f1 = figure('Position', [200 200 1500 550]);
line_width = 5;
axis_limits = [0 0.16 1e-08 2e-07];
afs = 10;

% plot standard ice curves
for i= 1:length(standard_incremental)
	subplot(2,length(standard_incremental), i+length(marine_incremental))
	number = standard_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	mech_data_file = strcat(mech_data_directory, experiment_number, '/', experiment_number, '_smoothed.csv');
	mech_data = readtable(mech_data_file);
	semilogy(mech_data.smoothed_octahedral_strain, mech_data.smoothed_octahedral_strain_rate, '-', 'LineWidth', line_width, 'color', c_standard+i*[shade shade shade]);
	hold on
	axis(axis_limits);
	xlabel('octahedral shear strain', 'FontSize', afs)
	ylabel('octahedral shear strain rate (s$^{-1}$)', 'FontSize', afs)
	title(strcat('\textbf{', char(experiment_number), '}'))
	grid on
end

% plot marine ice curves
%marine_ax = subplot(1,2,2)
for i= 1:length(marine_incremental)
	subplot(2,length(marine_incremental), i)
	number = marine_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	mech_data_file = strcat(mech_data_directory, experiment_number, '/', experiment_number, '_smoothed.csv');
	mech_data = readtable(mech_data_file);
	semilogy(mech_data.smoothed_octahedral_strain, mech_data.smoothed_octahedral_strain_rate, '-', 'LineWidth', line_width, 'color', c_marine+i*[shade shade shade]);
	hold on
	axis(axis_limits);
	xlabel('octahedral shear strain', 'FontSize', afs)
	ylabel('octahedral shear strain rate (s$^{-1}$)', 'FontSize', afs)
	grid on
	title(strcat('\textbf{', char(experiment_number), '}'))
end

export_fig '~/experimental_data/figures/incremental_stress_strain_separate' -png
