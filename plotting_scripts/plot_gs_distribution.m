% function to import an EBSD or FA dataset, and save a histogram of grain size distribution. Grain size is measured as area equivalent diameter

function plot_sphericity_distribution(input_path, output_path)
	afs = 14; % axis label font size
	load(input_path)
	max_value = 5000;
	bins = 0:100:max_value;
	equivalent_diameter = 2*equivalentRadius(grains);
	ncount = histc(equivalent_diameter, bins);
	relativefreq = ncount/length(equivalent_diameter)*100;
	figure
	bar(bins-0.01/2, relativefreq, 1, 'FaceColor', [0.6 0.4 0.8])
	xlim([min(bins) max(bins)]);
%	set(gca, 'xtick', bins)
	axis([0 max_value 0 15]);
	xlabel('Grain size (area equivalent diameter), $\mu$m','Interpreter', 'latex', 'fontsize',afs)
   ylabel('Relative Frequency (\%)','Interpreter', 'latex', 'fontsize',afs)
	export_fig(strcat(output_path, '_gs_distribution'), '-png')
end
