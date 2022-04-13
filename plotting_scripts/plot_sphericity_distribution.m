% function to import an EBSD or FA dataset, and save a histogram of grain sphericity distribution (see Fan et al.)

function plot_sphericity_distribution(input_path, output_path)
	afs = 14; % axis label font size
	load(input_path)
	max_value = 0.5;
	bins = 0:0.01:max_value;
	sphericity = grains.area./grains.perimeter('withInclusion')./grains.equivalentRadius;
	ncount = histc(sphericity, bins);
%	ncount = histc(bins, sphericity);
	relativefreq = ncount/length(sphericity)*100;
	figure
%	histogram(sphericity, bins, 'FaceColor', [1 0.6 0.4])
	bar(bins-0.01/2, relativefreq, 1, 'FaceColor', [1 0.6 0.4])
	xlim([min(bins) max(bins)]);
%	set(gca, 'xtick', bins)
	axis([0 0.5 0 20]);
	xlabel('Grain sphericity ($\psi$)','Interpreter', 'latex', 'fontsize',afs)
   ylabel('Relative Frequency (\%)','Interpreter', 'latex', 'fontsize',afs)
	export_fig(strcat(output_path, '_sphericity_distribution'), '-png')
end
