% functio to plot a simple ebsd map and save as .png
% requires function export_fig.m, from the Matlab File Exchange

function plot_spatial_map(input_path, output_path)
	load(input_path)
	fig = newMtexFigure;	
%	plot(ebsd('ice'),color, 'micronbar', 'off');
	plot(ebsd('Ice 1h'),trendColor,'micronbar','on')

	hold on
	bnd = grains.boundary('ice','ice');
	plot(grains.boundary,'linewidth',0.5, 'LineColor', 'k')

	mp = getappdata(fig.children(1),'mapPlot');
	mp.micronBar.length=5;

%	export_fig(output_path, '-png')
	filename = strcat(output_path, '.png');
	saveFigure(filename); 
	close all
end


