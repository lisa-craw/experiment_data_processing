% function to take displacement vs time data from ice mechanics experiments, apply cubic spline smoothing, and save as [exp_number]_smoothed.csv
% based on a script written by Adam Treverrow

function smooth_and_calc(input_file, output_file, z0, N1, N2, p_v)

% A matlab function to calculate the strain and corresponding strain rates in compression
% from experimental displacement and elapsed time data. Strain is calculated using 
% consecutive data points. The strain rate and mean time are calculated using a specified
% interval of N1 data points.
%
% Strain and strain rates are also calculated using a fit to the horizontal and vertical
% displacement data using cubic spline smoothing.
%
% Axial strain and strain rates in compression are calculated - the corresonding
% octahedral shear strains and strain rates are strain (rate) are NOT calculated. A
% separate function is required for this conversion.
%
% INPUT data:
% 
% input_file :: path to .csv file containing processed experimental output (from either correction script, or preprocessing script)
%
% output_file :: path to output location. Data will be saved as a .csv file 
%
% z0 :: initial vertical height of the sample (mm)
%
% N1 :: Time step interval used to calculate strain rates from the raw displacement data.
%
% N2 :: Time step interval used to calculate strain rates from the smoothed displacement
%   data.
%
%   Setting N1 = 0 and/or N2 = 0 corresponds to using consectutive strain values to
%   calculate strain rates.
%
% p_v :: smoothing parameter for the cubic spline fit to the horizontal displacement data
    % starting value p_v = 1e-2 (possibly lower, e.g. 1e-6 for slower rates???)   
%
% OUTPUT data:
% 
% structure array :: comp_strain_rate
%
% :: comp_strain_rate.rate :: strain rates from raw data (N1 used)
% :: comp_strain_rate.strain :: strain from raw data
% :: comp_strain_rate.mean_strain :: strains corresponding to strain rates (N1 used)
% :: comp_strain_rate.mean_time :: mean time values corresponding to strain rates (N1 used)
%
% :: comp_strain_rate.rateCS :: strain rates from smoothed raw data (N2 used)
% :: comp_strain_rate.strainCS :: strain from smoothed raw data
% :: comp_strain_rate.mean_strainCS :: strains corresponding to strain rates calculated
%   using smoothed data (N2 applies)
% :: comp_strain_rate.mean_timeCS :: mean time values corresponding to strain rates
%   calculated using smoothed data (N2 applies)
% :: comp_strain_rate.v_disCS :: cubic spline smoothing of the vertical displacement data.
%
% Some additional output variables have been included for use when there is a change in
% sign of the vertical displacement -- USE WITH CAUTION!!!!
% :: comp_strain_rate.strain_abs :: strain based on cumulative sum of the absolute values of
%   each displacement difference value 
% :: comp_strain_rate.rate_abs :: axial strain rates calculated using absolute values
%   of differences in displacement. 
% :: comp_strain_rate.mean_strain_abs :: mean values of the axial strain calculated
%   using absolute values of differences in displacement. 
% :: comp_strain_rate.strain_absC :: strain based on cumulative sum of the absolute values of
%   each displacement difference value - displacement data smoothed using a cubic spline
% :: comp_strain_rate.rate_absCS :: axial strain rates calculated using absolute values
%   of differences in displacement -- smoothed data.
% :: comp_strain_rate.mean_strain_absCS :: mean values of the axial strain calculated
%   using absolute values of differences in the smoothed displacement. 
%
% 
% Adam Treverrow 13/09/2018

tmp = readtable(input_file);
% easier to deal with this as a structure array
input_data.v_dis = tmp.v_dis;
input_data.h_dis = tmp.v_dis;
input_data.time = tmp.time;
input_data.temp = tmp.temp;


%% Calculate the axial strain and strain rate using the raw displacement data

% calculate the axial strain using consecutive data points
data.axial_strain = abs(cumsum(diff(input_data.v_dis)))./abs(z0 + input_data.v_dis(1:end-1,:));

% calculate the axial strain using the interval N1 to avoid strain increments = 0
data.axial_strain_rate = (data.axial_strain(N1+2:end) - ...
    data.axial_strain(1:end-N1-1))...
    ./(3600.*(input_data.time(N1+3:end) - input_data.time(2:end-N1-1)));
               
% calculate the mean time values for strain rates determined using the interval N1
data.mean_time = 0.5.*(input_data.time(2:end-N1-1) + input_data.time(N1+3:end));

% calculate the mean strain values for strain rates determined using the interval N1
data.mean_axial_strain = 0.5.*(data.axial_strain(1:end-N1-1) + ...
    data.axial_strain(N1+2:end));
        
%% Smooth the raw displacement data by fitting a cubic spline.

data.smoothed_v_dis = fnval(csaps(input_data.time,input_data.v_dis,p_v),input_data.time);

%% calculate the axial strain and strain rate using the smoothed displacement data

% calculate the axial strain from the smoothed data using consecutive data points
data.smoothed_axial_strain = abs(cumsum(diff(data.smoothed_v_dis)))...
    ./abs(z0 + data.smoothed_v_dis(1:end-1));

% calculate the axial strain rate using the interval N2 to avoid
%   strain increments = 0
data.smoothed_axial_strain_rate = (data.smoothed_axial_strain(N2+2:end) - ...
    data.smoothed_axial_strain(1:end-N2-1))...
    ./(3600.*(input_data.time(N2+3:end) - input_data.time(2:end-N2-1)));
    
% calculate the mean time values for strain rates determined using the interval N2
data.smoothed_mean_time = 0.5.*(input_data.time(2:end-N2-1) + input_data.time(N2+3:end));

% calculate the mean strain values for strain rates determined using the interval N2 
data.smoothed_mean_axial_strain = 0.5.*(data.smoothed_axial_strain(1:end-N2-1) + ...
    data.smoothed_axial_strain(N2+2:end));

data.smoothed_octahedral_strain = data.smoothed_mean_axial_strain./sqrt(2);
data.smoothed_octahedral_strain_rate = data.smoothed_axial_strain_rate./sqrt(2);

table.smoothed_mean_time = data.smoothed_mean_time;
table.smoothed_axial_strain = data.smoothed_mean_axial_strain;
table.smoothed_axial_strain_rate = data.smoothed_axial_strain_rate;
table.smoothed_octahedral_strain = data.smoothed_octahedral_strain;
table.smoothed_octahedral_strain_rate = data.smoothed_octahedral_strain_rate;

writetable(struct2table(table), output_file)

end
