% script to process all experimental data, by smoothing with cubic spline, correcting for load top-ups and equipment errors, and calculating strain rates. This uses several functions defined in the same directory:
% import_data.m
% preprocess.m
% all functions in the directory /correction_scripts (one for each experiment)
% smooth_and_calc.m

%and requires the files experiment_parameters.csv, and all experimental output (a series of .txt files, all stored in a directory titled with the experiment number)

%number of experiments which are ready to be processed (some might not have any data yet)
num_experiments = 45;

%load table of experiment parameters
experiment_list = readtable('~/experimental_data/experiment_parameters.csv');

experiment_numbers = experiment_list.experiment_number;
starting_points = experiment_list.starting_point;
end_points = experiment_list.end_point;

% import data {{{ 
% import from labVIEW .txt files, and save as a .csv file in each experiment directory as [exp_number]_raw_data.csv 
%for i=1:length(experiment_numbers)
for i=1:num_experiments
	import_data(char(experiment_numbers(i)));
end
%}}}

% preprocess data {{{
% load each raw data structure and remove obvious errors due to sticky dial gauges, temperature errors etc 
for k=1:num_experiments
	if isnan(starting_points(k))==0 & isnan(end_points(k))==0
	preprocess(char(experiment_numbers(k)), starting_points(k), end_points(k));
else
end
end
%}}}

% correct datasets for load adjustments and other disturbances. {{{
% Corrections have all been manually identified. Output is saved as [exp_number]_corrected.csv
addpath '~/Documents/MATLAB/experiment_data_process/correction_scripts/'

LC001_corrections('~/experimental_data/LC001/LC001_preprocessed.csv', '~/experimental_data/LC001/LC001_corrected.csv');
LC002_corrections('~/experimental_data/LC002/LC002_preprocessed.csv', '~/experimental_data/LC002/LC002_corrected.csv');
%LC003_corrections('~/experimental_data/LC003/LC003_preprocessed.csv', '~/experimental_data/LC003/LC003_corrected.csv');
LC004_corrections('~/experimental_data/LC004/LC004_preprocessed.csv', '~/experimental_data/LC004/LC004_corrected.csv');
LC005_corrections('~/experimental_data/LC005/LC005_preprocessed.csv', '~/experimental_data/LC005/LC005_corrected.csv');
LC006_corrections('~/experimental_data/LC006/LC006_preprocessed.csv', '~/experimental_data/LC006/LC006_corrected.csv');
LC007_corrections('~/experimental_data/LC007/LC007_preprocessed.csv', '~/experimental_data/LC007/LC007_corrected.csv');
LC008_corrections('~/experimental_data/LC008/LC008_preprocessed.csv', '~/experimental_data/LC008/LC008_corrected.csv');
LC009_corrections('~/experimental_data/LC009/LC009_preprocessed.csv', '~/experimental_data/LC009/LC009_corrected.csv');
LC010_corrections('~/experimental_data/LC010/LC010_preprocessed.csv', '~/experimental_data/LC010/LC010_corrected.csv');
LC011_corrections('~/experimental_data/LC011/LC011_preprocessed.csv', '~/experimental_data/LC011/LC011_corrected.csv');
LC012_corrections('~/experimental_data/LC012/LC012_preprocessed.csv', '~/experimental_data/LC012/LC012_corrected.csv');
LC013_corrections('~/experimental_data/LC013/LC013_preprocessed.csv', '~/experimental_data/LC013/LC013_corrected.csv');
LC014_corrections('~/experimental_data/LC014/LC014_preprocessed.csv', '~/experimental_data/LC014/LC014_corrected.csv');
LC015_corrections('~/experimental_data/LC015/LC015_preprocessed.csv', '~/experimental_data/LC015/LC015_corrected.csv');
LC016_corrections('~/experimental_data/LC016/LC016_preprocessed.csv', '~/experimental_data/LC016/LC016_corrected.csv');
LC017_corrections('~/experimental_data/LC017/LC017_preprocessed.csv', '~/experimental_data/LC017/LC017_corrected.csv');
LC018_corrections('~/experimental_data/LC018/LC018_preprocessed.csv', '~/experimental_data/LC018/LC018_corrected.csv');
LC019_corrections('~/experimental_data/LC019/LC019_preprocessed.csv', '~/experimental_data/LC019/LC019_corrected.csv');
LC020_corrections('~/experimental_data/LC020/LC020_preprocessed.csv', '~/experimental_data/LC020/LC020_corrected.csv');
LC021_corrections('~/experimental_data/LC021/LC021_preprocessed.csv', '~/experimental_data/LC021/LC021_corrected.csv');
LC022_corrections('~/experimental_data/LC022/LC022_preprocessed.csv', '~/experimental_data/LC022/LC022_corrected.csv');
LC023_corrections('~/experimental_data/LC023/LC023_preprocessed.csv', '~/experimental_data/LC023/LC023_corrected.csv');
LC024_corrections('~/experimental_data/LC024/LC024_preprocessed.csv', '~/experimental_data/LC024/LC024_corrected.csv');
LC025_corrections('~/experimental_data/LC025/LC025_preprocessed.csv', '~/experimental_data/LC025/LC025_corrected.csv');
LC026_corrections('~/experimental_data/LC026/LC026_preprocessed.csv', '~/experimental_data/LC026/LC026_corrected.csv');
LC027_corrections('~/experimental_data/LC027/LC027_preprocessed.csv', '~/experimental_data/LC027/LC027_corrected.csv');
LC028_corrections('~/experimental_data/LC028/LC028_preprocessed.csv', '~/experimental_data/LC028/LC028_corrected.csv');
LC029_corrections('~/experimental_data/LC029/LC029_preprocessed.csv', '~/experimental_data/LC029/LC029_corrected.csv');
LC030_corrections('~/experimental_data/LC030/LC030_preprocessed.csv', '~/experimental_data/LC030/LC030_corrected.csv');
LC031_corrections('~/experimental_data/LC031/LC031_preprocessed.csv', '~/experimental_data/LC031/LC031_corrected.csv');
LC032_corrections('~/experimental_data/LC032/LC032_preprocessed.csv', '~/experimental_data/LC032/LC032_corrected.csv');
LC033_corrections('~/experimental_data/LC033/LC033_preprocessed.csv', '~/experimental_data/LC033/LC033_corrected.csv');
LC034_corrections('~/experimental_data/LC034/LC034_preprocessed.csv', '~/experimental_data/LC034/LC034_corrected.csv');
LC035_corrections('~/experimental_data/LC035/LC035_preprocessed.csv', '~/experimental_data/LC035/LC035_corrected.csv');
LC036_corrections('~/experimental_data/LC036/LC036_preprocessed.csv', '~/experimental_data/LC036/LC036_corrected.csv');
LC037_corrections('~/experimental_data/LC037/LC037_preprocessed.csv', '~/experimental_data/LC037/LC037_corrected.csv');
LC038_corrections('~/experimental_data/LC038/LC038_preprocessed.csv', '~/experimental_data/LC038/LC038_corrected.csv');
LC039_corrections('~/experimental_data/LC039/LC039_preprocessed.csv', '~/experimental_data/LC039/LC039_corrected.csv');
LC040_corrections('~/experimental_data/LC040/LC040_preprocessed.csv', '~/experimental_data/LC040/LC040_corrected.csv');
LC041_corrections('~/experimental_data/LC041/LC041_preprocessed.csv', '~/experimental_data/LC041/LC041_corrected.csv');
LC042_corrections('~/experimental_data/LC042/LC042_preprocessed.csv', '~/experimental_data/LC042/LC042_corrected.csv');
LC043_corrections('~/experimental_data/LC043/LC043_preprocessed.csv', '~/experimental_data/LC043/LC043_corrected.csv');
LC044_corrections('~/experimental_data/LC044/LC044_preprocessed.csv', '~/experimental_data/LC044/LC044_corrected.csv');
LC045_corrections('~/experimental_data/LC045/LC045_preprocessed.csv', '~/experimental_data/LC045/LC045_corrected.csv');
%}}}

%% smooth data and save {{{
% load each corrected dataset, smooth with a cubic spline and calculate strain rates using supplied parameters. Save as [exp_number]_smoothed.csv.
N1 = 2000;
N2 = 2000;
p_v = 1e-2;

for i=1:num_experiments
	exp_num = char(experiment_list.experiment_number(i));
	if isfile(strcat('~/experimental_data/', exp_num, '/', exp_num, '_corrected.csv'))
		smooth_and_calc(strcat('~/experimental_data/', exp_num, '/', exp_num, '_corrected.csv'), strcat('~/experimental_data/', exp_num, '/', exp_num, '_smoothed.csv'), experiment_list.z_0(i), N1, N2, p_v)
	else
	end
end

%}}}

% extract strain rate data {{{
% check if there is a file of strain rate data. If not, prompt user to select strain rates
if isfile('~/experimental_data/strain_rates.csv')==0
	strain_rates_tabulate
end
%}}}

% add total accumulated strain to strain_rates.csv {{{
strain_rates = readtable('~/experimental_data/strain_rates.csv');
experiment_numbers = strain_rates.experiment_number;
already_exists = strcmp('max_axial_strain', strain_rates.Properties.VariableNames);

if already_exists==0;
	for i=1:length(experiment_numbers)
	experiment_number = char(experiment_numbers(i));
		if isfile(strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv'));
			data = readtable(strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_smoothed.csv'));
			max_axial_strain = max(data.smoothed_axial_strain);
			max_octahedral_strain = max(data.smoothed_octahedral_strain);
			strain_rates.max_axial_strain(i) = max_axial_strain;
			strain_rates.max_octahedral_strain(i) = max_octahedral_strain;
		end	
	end
writetable(strain_rates, '~/experimental_data/strain_rates.csv');
end


%}}}
