%% load each fabric analyser dataset in turn, and generate figures:
% spatial EBSD map
% pole figures
% grain size distribution
% and export grain data for each sample as .csv.

% calls the functions (contained in ./plotting_scripts):
% plot_spatial_map
% plot_pole_figs
% plot_gs_distribution
% export_grain_data

%mtex_settings
addpath ~/Documents/MATLAB/cmocean_v2.0/cmocean/

% specify paths to the data directory and working directory
data_directory = '~/experimental_data/microstructure_data/';
working_directory = '/home/lcraw/Documents/MATLAB/experiment_data_process/';

%number of experiments which are ready to be processed (some might not have any data yet)
num_experiments = 45;

%load table of experiment parameters
experiment_list = readtable('~/experimental_data/experiment_parameters.csv');
experiment_numbers = experiment_list.experiment_number;

% plot spatial maps {{{
for i = 1:length(experiment_numbers)
	experiment_number = char(experiment_numbers(i));
	undeformed_input = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA_smoothed.mat');
	undeformed_output = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA_spatial');
	deformed_input = strcat(data_directory, experiment_number, '/', experiment_number, '_FA_smoothed.mat');
	deformed_output = strcat(data_directory, experiment_number, '/', experiment_number, '_FA_smoothed');
	if isfile (undeformed_input)
		plot_spatial_map(undeformed_input, undeformed_output)
	end
	if isfile(deformed_input)
		plot_spatial_map(deformed_input, deformed_output)
	end
end

%}}}

% plot pole figs {{{

deformed_num_grains = 500; %set to less than the smallest number of grains in any section to have them all consistent, or 'all'
undeformed_num_grains = 'all'; %set to less than the smallest number of grains in any section to have them all consistent, or 'all'

for i = 1:length(experiment_numbers)
	experiment_number = char(experiment_numbers(i));
	undeformed_input = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA_smoothed.mat');
	undeformed_output = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA');
	deformed_input = strcat(data_directory, experiment_number, '/', experiment_number, '_FA_smoothed.mat');
	deformed_output = strcat(data_directory, experiment_number, '/', experiment_number, '_FA');
	if isfile (undeformed_input)
		plot_pole_figs(undeformed_input, undeformed_output, 'all')
	end
	if isfile(deformed_input)
		plot_pole_figs(deformed_input, deformed_output, 'all')
	end
end

%}}}

% plot grain size distribution {{{
%plot_gs_distribution('standard_FA/standard_20micron_FA_smoothed.mat', 'output/standard_FA')

for i = 1:length(experiment_numbers)
	experiment_number = char(experiment_numbers(i));
	undeformed_input = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA_smoothed.mat');
	undeformed_output = strcat(data_directory, experiment_number, '_undeformed/', experiment_number, '_undeformed_FA');
	deformed_input = strcat(data_directory, experiment_number, '/', experiment_number, '_FA_smoothed.mat');
	deformed_output = strcat(data_directory, experiment_number, '/', experiment_number, '_FA');
	if isfile (undeformed_input)
		plot_gs_distribution(undeformed_input, undeformed_output)
	end
	if isfile(deformed_input)
		plot_gs_distribution(deformed_input, deformed_output)
	end
end

%}}}


