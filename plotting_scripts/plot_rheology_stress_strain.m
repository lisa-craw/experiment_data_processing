% script to plot stress vs. strain data from all rheology experiments (excludes temperature change and microstructure evolution experiments, i.e. only constant temp experiments which reached teriary strain)

%% select only experiments which reached tertiary and didn't have a temperature change {{{
strain_rates = readtable('~/experimental_data/strain_rates.csv');

changing_temp = contains(strain_rates.temperature, ',');
rheology_list = strain_rates(~changing_temp, :);
not_tertiary = isnan(rheology_list.tertiary_rate_1);
rheology_list = rheology_list(~not_tertiary, :);
%%}}}

% separate out marine, meteoric and standard ice {{{ 
is_standard = strcmp(rheology_list.ice_type, 'standard');
standard_ice = rheology_list(is_standard, :);
is_marine = strcmp(rheology_list.ice_type, 'marine');
marine_ice = rheology_list(is_marine, :);
is_meteoric = strcmp(rheology_list.ice_type, 'meteoric');
meteoric_ice = rheology_list(is_meteoric, :);

%}}}


