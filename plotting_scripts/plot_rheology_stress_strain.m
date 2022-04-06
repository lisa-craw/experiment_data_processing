% script to plot stress vs. strain data from all rheology experiments (excludes temperature change and microstructure evolution experiments, i.e only constant temp experiments which reached teriary strain)

strain_rates = readtable('~/experimental_data/strain_rates.csv');

changing_temp = contains(strain_rates.temperature, ',');
rheology_list = strain_rates(~changing_temp, :);
not_tertiary = isnan(rheology_list.tertiary_rate_1);
rheology_list = rheology_list(~not_tertiary, :);

