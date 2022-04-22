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

f1 = figure('Position', [200 200 1500 550]);
marker_size = 40;
circle_size = 10;
dotted_line_width = 1;
left_axis_limits = [0 0.15 700 1500];
right_axis_limits = [0 0.15 0 7];
afs = 14;

left_colour = c_standard-shade;
right_colour = c_standard+shade;

% plot standard ice data 
standard_ax = subplot(1,2,1)
for i= 1:length(standard_incremental)
	number = standard_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	yyaxis left
	left_axis = gca;
	left_axis.YColor = left_colour;
	plot(all_data.max_octahedral_strain(number), all_data.deformed_median_grain_size(number), '.', 'MarkerSize', marker_size, 'color', left_colour);
	hold on
	yyaxis right
	right_axis = gca;
	right_axis.YColor = right_colour;
	plot(all_data.max_octahedral_strain(number), all_data.deformed_jindex(number), 'o', 'MarkerSize', circle_size, 'color', right_colour);
	hold on
%	legend('median grain size', 'J-index');
end
%axis(axis_limits);
xlabel('maximum octahedral shear strain', 'FontSize', afs)
yyaxis left
ylabel('median grain size, $\mu$m', 'FontSize', afs)

%trend line (excluding first two values, as these have barely any drx)
standard_strain = all_data.max_octahedral_strain(standard_incremental);
ind = find(standard_strain>0.01);
trendline_ind = standard_incremental(ind);
standard_gs_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_median_grain_size(trendline_ind), 1);
standard_gs_fit = polyval(standard_gs_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [standard_gs_fit(1) standard_gs_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', left_colour, 'HandleVisibility', 'off');

standard_grain_sizes = all_data.deformed_median_grain_size(standard_incremental);
axis(left_axis_limits)
yyaxis right
ylabel('J-index', 'FontSize', afs)
axis(right_axis_limits)

%trend line (excluding first two values, as these have barely any drx)
standard_strain = all_data.max_octahedral_strain(standard_incremental);
ind = find(standard_strain>0.01);
trendline_ind = standard_incremental(ind);
standard_jindex_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_jindex(trendline_ind), 1);
standard_jindex_fit = polyval(standard_jindex_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [standard_jindex_fit(1) standard_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', right_colour, 'HandleVisibility', 'off');


%legend(leg, 'Location', 'southeast')
title('\textbf{standard ice}')
grid on

% plot marine ice data 
left_colour = c_marine-shade;
right_colour = c_marine+shade;
marine_ax = subplot(1,2,2);
for i= 1:length(marine_incremental)
	number = marine_incremental(i);
	experiment_number = char(all_data.experiment_number(number));
	yyaxis left
	left_axis = gca;
	left_axis.YColor = left_colour;
	plot(all_data.max_octahedral_strain(number), all_data.deformed_median_grain_size(number), '.', 'MarkerSize', marker_size, 'color', left_colour);
	hold on
	yyaxis right
	right_axis = gca;
	right_axis.YColor = right_colour;
	plot(all_data.max_octahedral_strain(number), all_data.deformed_jindex(number), 'o', 'MarkerSize', circle_size, 'color', right_colour);
	hold on
%	legend('median grain size', 'J-index');
end
%axis(axis_limits);
xlabel('maximum octahedral shear strain', 'FontSize', afs)
yyaxis left
ylabel('median grain size, $\mu$m', 'FontSize', afs)

%trend line (excluding first two values, as these have barely any drx)
marine_strain = all_data.max_octahedral_strain(marine_incremental);
ind = find(marine_strain>0.01);
trendline_ind = marine_incremental(ind);
marine_gs_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_median_grain_size(trendline_ind), 1);
marine_gs_fit = polyval(marine_gs_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [marine_gs_fit(1) marine_gs_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', left_colour, 'HandleVisibility', 'off');

marine_grain_sizes = all_data.deformed_median_grain_size(marine_incremental);
axis(left_axis_limits)
yyaxis right
ylabel('J-index', 'FontSize', afs)
axis(right_axis_limits)

%trend line (excluding first two values, as these have barely any drx)
marine_strain = all_data.max_octahedral_strain(marine_incremental);
ind = find(marine_strain>0.01);
trendline_ind = marine_incremental(ind);
marine_jindex_p = polyfit(all_data.max_octahedral_strain(trendline_ind), all_data.deformed_jindex(trendline_ind), 1);
marine_jindex_fit = polyval(marine_jindex_p, all_data.max_octahedral_strain(trendline_ind));
plot([all_data.max_octahedral_strain(trendline_ind(1)) all_data.max_octahedral_strain(trendline_ind(end))], [marine_jindex_fit(1) marine_jindex_fit(end)], '--', 'Linewidth', dotted_line_width, 'color', right_colour, 'HandleVisibility', 'off');


title('\textbf{marine ice}')
grid on

