% script to plot stress vs. strain for all experiments in the incremental strain series (experiments performed under the same conditions, but stopped at increasing strains to examine microstructural evolution)

%directory containing microstructure data
mech_data_directory = '~/experimental_data/';
micro_data_directory = '~/experimental_data/microstructure_data/';

all_data = readtable(strcat(mech_data_directory, '/all_data.csv'));

% list numbers of all of the target experiments
standard_incremental = [2 11 9 8 10 29 13];

marine_incremental = [18 17 16 32 36 35];

% set colors {{{
c_standard = [0.4431 0.2431 0.3529]+[0.3 0.3 0.3];
c_marine = [0.2157 0.4431 0.5569]+[0.3 0.3 0.3];;
shade = 0.05;
%}}}

f1 = figure('Position', [200 200 1500 550]);
line_width = 5;
dotted_line_width = 3;
axis_limits = [0 0.2 1e-08 3e-07];
afs = 10;

% plot standard ice curves
standard_ax = subplot(1,2,1)
for i= 1:length(standard_incremental)
%	subplot(2,length(standard_incremental), i+length(marine_incremental))
	number = standard_incremental(i);
	colour = c_standard-i*[shade shade shade];
	experiment_number = char(all_data.experiment_number(number));
	mech_data_file = strcat(mech_data_directory, experiment_number, '/', experiment_number, '_smoothed.csv');
	mech_data = readtable(mech_data_file);
	semilogy(mech_data.smoothed_octahedral_strain, mech_data.smoothed_octahedral_strain_rate, '-', 'LineWidth', line_width, 'color', colour);
	hold on
	xline(max(mech_data.smoothed_octahedral_strain), '--', 'color', colour, 'LineWidth', dotted_line_width, 'HandleVisibility', 'off');
	leg{i} = experiment_number;
end
axis(axis_limits);
xlabel('octahedral shear strain', 'FontSize', afs)
ylabel('octahedral shear strain rate (s$^{-1}$)', 'FontSize', afs)
legend(leg)
title('\textbf{standard ice}')
grid on

% plot marine ice curves
marine_ax = subplot(1,2,2)
for i= 1:length(marine_incremental)
%	subplot(2,length(marine_incremental), i)
	number = marine_incremental(i);
	colour = c_marine-i*[shade shade shade];
	experiment_number = char(all_data.experiment_number(number));
	mech_data_file = strcat(mech_data_directory, experiment_number, '/', experiment_number, '_smoothed.csv');
	mech_data = readtable(mech_data_file);
	semilogy(mech_data.smoothed_octahedral_strain, mech_data.smoothed_octahedral_strain_rate, '-', 'LineWidth', line_width, 'color', colour);
	hold on
	xline(max(mech_data.smoothed_octahedral_strain), '--', 'color', colour, 'LineWidth', dotted_line_width, 'HandleVisibility', 'off');
	leg{i} = experiment_number;
end
axis(axis_limits);
xlabel('octahedral shear strain', 'FontSize', afs)
ylabel('octahedral shear strain rate (s$^{-1}$)', 'FontSize', afs)
grid on
legend(leg)
title('\textbf{marine ice}')

export_fig '~/experimental_data/figures/incremental_stress_strain' -png
