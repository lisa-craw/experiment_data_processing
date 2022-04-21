% functio to plot a simple ebsd map and save as .png
% requires function export_fig.m, from the Matlab File Exchange

function plot_spatial_map(input_path, output_path)
	load(input_path)
	fig1 = newMtexFigure;	
%	plot(ebsd('ice'),color, 'micronbar', 'off');
	plot(ebsd('Ice 1h'),trendColor,'micronbar','on')

	hold on
	bnd = grains.boundary('ice','ice');
	plot(grains.boundary,'linewidth',1, 'LineColor', 'k')

	mp = getappdata(fig1.children(1),'mapPlot');
	mp.micronBar.length=5;

%	export_fig(output_path, '-png')
	filename = strcat(output_path, '_scale.png');
	saveFigure(filename); 

	close all
	
	fig2 = newMtexFigure;	
%	plot(ebsd('ice'),color, 'micronbar', 'off');
	plot(ebsd('Ice 1h'),trendColor,'micronbar','off')

	hold on
	bnd = grains.boundary('ice','ice');
	plot(grains.boundary,'linewidth',1, 'LineColor', 'k')

	filename = strcat(output_path, '.png');
	saveFigure(filename); 

	close all
end


