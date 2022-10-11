% script to plot max strain vs median grain size and j-index for all experiments in the incremental strain series (experiments performed under the same conditions, but stopped at increasing strains to examine microstructural evolution)

all_data = readtable('~/experimental_data/all_data.csv');

% list numbers of all of the target experiments
standard_incremental = [13 10 11 29 8 9 1 2];

marine_incremental = [35 36 32 17];

% set colors {{{
c_standard = [0.4431 0.2431 0.3529]+[0.1 0.1 0.1];
c_marine = [0.2157 0.4431 0.5569];
shade = [0.15 0.15 0.15];
%}}}

f1 = figure('Position', [200 200 1300 500]);
marker_size = 30;
dotted_line_width = 1;
afs = 18; %axis label font size
tfs = 20; %title font size

% set axes {{{
gs_ax = subplot(1,2,1)
xlabel('maximum octahedral shear strain', 'FontSize', afs)
ylabel('median grain size, $\mu$m', 'FontSize', afs)
title('grain size')
hold on

jindex_ax = subplot(1,2,2)
xlabel('maximum octahedral shear strain', 'FontSize', afs)
ylabel('J-index', 'FontSize', afs)
title('CPO intensity')
hold on

%sphericity_ax = subplot(1,3,3)
%xlabel('maximum octahedral shear strain', 'FontSize', afs)
%ylabel('mean sphericity, $\psi$', 'FontSize', afs)
%title('grain sphericity')
%hold on

gs_ax.Position = gs_ax.Position + [0 0.06 0 -0.08];

%}}}

% create vectors to store sphericity data
standard_sphericity = zeros(length(standard_incremental),1);
marine_sphericity = zeros(length(marine_incremental), 1);
 
% plot standard ice data 
for i= 1:length(standard_incremental)
	if i==1
	   handle = 'on';
	else
	   handle = 'off'; 
	end
	number = standard_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	%grain size data
	axes(gs_ax)
	plot(all_data.max_octahedral_strain(number), all_data.deformed_median_grain_size(number), '.', 'MarkerSize', marker_size, 'color', c_standard, 'HandleVisibility', handle);
	%j-index data
	axes(jindex_ax)
	plot(all_data.max_octahedral_strain(number), all_data.deformed_jindex(number), '.', 'MarkerSize', marker_size, 'color', c_standard, 'HandleVisibility', handle);
	%sphericity data
%	grain_data = readtable(strcat('~/experimental_data/FA_data/', experiment_number, '/', experiment_number, '_FA_grain_data.csv'));
%	mean_sphericity = mean(grain_data.sphericity);
%	standard_sphericity(i) = mean_sphericity;
%	axes(sphericity_ax)
%	plot(all_data.max_octahedral_strain(number), mean_sphericity, '.', 'MarkerSize', marker_size, 'color', c_standard, 'HandleVisibility', handle);
end

% plot marine ice data 
for i= 1:length(marine_incremental)
	if i==1
	   handle = 'on';
	else
	   handle = 'off'; 
	end
	number = marine_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	%grain size data
	axes(gs_ax)
	plot(all_data.max_octahedral_strain(number), all_data.deformed_median_grain_size(number), '.', 'MarkerSize', marker_size, 'color', c_marine, 'HandleVisibility', handle);
	%j-index data
	axes(jindex_ax)
	plot(all_data.max_octahedral_strain(number), all_data.deformed_jindex(number), '.', 'MarkerSize', marker_size, 'color', c_marine, 'HandleVisibility', handle);
	%sphericity data
%	grain_data = readtable(strcat('~/experimental_data/FA_data/', experiment_number, '/', experiment_number, '_FA_grain_data.csv'));
%	mean_sphericity = mean(grain_data.sphericity);
%	marine_sphericity(i) = mean_sphericity;
%	axes(sphericity_ax)
%	plot(all_data.max_octahedral_strain(number), mean_sphericity, '.', 'MarkerSize', marker_size, 'color', c_marine, 'HandleVisibility', handle);
end

%axis(axis_limits);

%standard ice trend lines (excluding first two values, as these have barely any drx)
standard_strain = all_data.max_octahedral_strain(standard_incremental);
ind = find(standard_strain>0.01);
trendline_ind = standard_incremental(ind);

axes(gs_ax)
standard_gs_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_median_grain_size(trendline_ind), 1);
standard_gs_fit = polyval(standard_gs_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [standard_gs_fit(1) standard_gs_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_standard, 'HandleVisibility', 'off');

axes(jindex_ax)
standard_jindex_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_jindex(trendline_ind), 1);
standard_jindex_fit = polyval(standard_jindex_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [standard_jindex_fit(1) standard_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_standard, 'HandleVisibility', 'off');

%axes(sphericity_ax)
%standard_sphericity_p = polyfit(all_data.max_octahedral_strain(trendline_ind), standard_sphericity(end-(length(trendline_ind)-1):end), 1);
%standard_jindex_fit = polyval(standard_sphericity_p, all_data.max_octahedral_strain(trendline_ind));
%plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [standard_jindex_fit(1) standard_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_standard, 'HandleVisibility', 'off');

%marine ice trend lines (excluding first two values, as these have barely any drx)
marine_strain = all_data.max_octahedral_strain(marine_incremental);
ind = find(marine_strain>0.01);
trendline_ind = marine_incremental(ind);

axes(gs_ax)
marine_gs_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_median_grain_size(trendline_ind), 1);
marine_gs_fit = polyval(marine_gs_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [marine_gs_fit(1) marine_gs_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_marine, 'HandleVisibility', 'off');

axes(jindex_ax)
marine_jindex_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_jindex(trendline_ind), 1);
marine_jindex_fit = polyval(marine_jindex_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [marine_jindex_fit(1) marine_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_marine, 'HandleVisibility', 'off');

%axes(sphericity_ax)
%marine_sphericity_p = polyfit(all_data.max_octahedral_strain(trendline_ind), marine_sphericity(end-(length(trendline_ind)-1):end), 1);
%marine_jindex_fit = polyval(marine_sphericity_p, all_data.max_octahedral_strain(trendline_ind));
%plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [marine_jindex_fit(1) marine_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', c_marine, 'HandleVisibility', 'off');

axes(jindex_ax)
legend('standard ice', 'marine ice', 'Location', 'southeast')

%saveas(gcf, '~/experimental_data/figures/incremental_gs_jindex.png');
export_fig '~/experimental_data/figures/incremental_gs_jindex_sphericity' -png
