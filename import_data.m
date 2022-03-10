%data = expt_data_import_vi;
%data.v_dis = data.h_dis;

%data.v_dis = abs(data.v_dis);

%function to import data from ice deformation experiments conducted in the IMAS Ice Mechanics Laboratory recorded using LabVIEW data acquisition system to record displacement, temperature and time.
% returns a structure array with the following elements:
% % expt_data.header :: experimental parameters from the header of the 1st file loaded.
% expt_data.time :: cumulative time from the start of the experiment.
% expt_data.h_dis :: horizontal displacement
% expt_data.v_dis :: vertical displacement
% expt_data.temp :: bath temperature

function import_data(experiment_number)

%experiment_number = 'LC002';
file_path = strcat('~/experimental_data/', experiment_number, '/');
file_list = dir(fullfile(strcat(file_path, '/*.txt')));
filenames = {file_list.name};

%% extract the data from each data file - store in cell array.

% The data block in the experimental data files has a standard format:

% year month day hour min sec h_dis v_dis temp - 9 columns of data
formatSpec = '%f %f %f %f %f %f %9.5f %9.5f %10.5f';
% preallocate the cell array tmp_data
tmp_data{length(filenames),9} = [];

for i=1:length(filenames)
	fid = fopen(strcat(file_path, char(filenames(i))), 'r');
	tmp_data(i,:) = textscan(fid, formatSpec, 'Headerlines', 9);
	fclose(fid);
end

%% calculate the elapsed time since the start of the experiment
% convert the 24 hour clock time of each data point into decimal hours
time_dec = vertcat(tmp_data{:,4}) + vertcat(tmp_data{:,5})./60 + ...
    vertcat(tmp_data{:,6})./3600;
% calculate the cumulative time from the beginning of the data file for 
% each data point in hours.
time_tmp = cumsum([0;mod(diff(time_dec),24)]);

%% Extract the experimental parameters from the header - first data file only

fid = fopen(strcat(file_path,filenames{1}),'r');
% Get the header information - by inspection there are 9 lines
Nhead = 9;

% preallocate header variable
header{Nhead,1} = [];

for i = 1:Nhead
header{i,:} = fgetl(fid);
end

fclose(fid);

%% create a structure array from the concatenated raw data files

% first locate any duplicated data rows - indicated by equivalent time values
[I, X] = find(diff(time_tmp) == 0);

if isempty(X)

%    expt_data.header = header;
    expt_data.time = time_tmp;
    expt_data.v_dis =  vertcat(tmp_data{:,7});
    expt_data.h_dis = vertcat(tmp_data{:,8});
    expt_data.temp = vertcat(tmp_data{:,9});

else

%    expt_data.header = header;
    expt_data.time = time_tmp;
    expt_data.time(I+1) = [];
    expt_data.v_dis =  vertcat(tmp_data{:,7});
    expt_data.v_dis(I+1) =  [];
    expt_data.h_dis = vertcat(tmp_data{:,8});
    expt_data.h_dis(I+1) = [];
    expt_data.temp = vertcat(tmp_data{:,9});
    expt_data.temp(I+1) = [];
end

structure_name = strcat(experiment_number, '_raw_data');
%assignin('base', structure_name, expt_data)
%save(strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_raw_data.mat'), structure_name)
writetable(struct2table(expt_data), strcat('~/experimental_data/', experiment_number, '/', experiment_number, '_raw_data.csv'));

end
