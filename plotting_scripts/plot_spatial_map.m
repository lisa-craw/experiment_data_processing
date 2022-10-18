% function to plot a simple ebsd map and save as .png

function plot_spatial_map(input_path, output_path)
	load(input_path)
	fig1 = newMtexFigure;	
	if contains(input_path, 'EBSD')
		oM = ipdfHSVOrientationMapping(ebsd('ice'));
		oM.inversePoleFigureDirection = xvector;
		color = oM.orientation2color(ebsd('ice').orientations);
		plot(ebsd('ice'),color, 'micronbar', 'on');
	else
		plot(ebsd('Ice 1h'),trendColor,'micronbar','on')
	end

	hold on
%	bnd = grains.boundary('ice','ice');
	plot(grains.boundary,'linewidth',1.5, 'LineColor', 'k')

	mp = getappdata(fig1.children(1),'mapPlot');
	mp.micronBar.length=5;

%	export_fig(output_path, '-png')
	filename = strcat(output_path, '_scale.png');
	saveFigure(filename); 

	close all
	
	fig2 = newMtexFigure;	
	if contains(input_path, 'EBSD')
		color = oM.orientation2color(ebsd('ice').orientations);
		plot(ebsd('ice'),color, 'micronbar', 'off');
	else
		plot(ebsd('Ice 1h'),trendColor,'micronbar','off')
	end
	hold on
%	bnd = grains.boundary('ice','ice');
	plot(grains.boundary,'linewidth',1.5, 'LineColor', 'k')

	filename = strcat(output_path, '.png');
	saveFigure(filename); 

	close all
end


