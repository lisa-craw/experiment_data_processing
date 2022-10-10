%% load each high res EBSD dataset in turn, and generate figures:
% spatial EBSD map
% mis2mean
% kernel average misorientation

% calls auxiliary functions:
% plot_spatial_map
% plot_mis2mean
% plot_KAM

%mtex_settings
mtex
addpath ~/Documents/MATLAB/cmocean_v2.0/cmocean/

% specify paths to the data directory and working directory
data_directory = '~/experimental_data/EBSD_data/hi_res/';
working_directory = '/home/lcraw/Documents/MATLAB/experiment_data_process/';

dir_list = dir(data_directory);
dir_list = {dir_list.name}';
% remove . and ..
dir_list = dir_list(3:end);
dir_list = {'LC032_hires2'}


% plot spatial maps {{{
for i = 1:length(dir_list)
	experiment_number = char(dir_list(i));
	input = strcat(data_directory, experiment_number, '/', experiment_number, '.mat');
	output_path = strcat(data_directory, experiment_number, '/', experiment_number);
	%plot_spatial_map(input, output_path)
	plot_mis2mean(input, output_path)
	plot_KAM(input, output_path)
end

%}}}





