% function to plot misorientation to mean map of high resolution EBSD maps (or low res, for that matter)

function plot_KAM(input_path, output_path)
	load(input_path)
	% calculate mis2mean
	kam = ebsd.KAM/degree;
	plot(ebsd, kam)
	caxis([0,5])
	mtexColorbar
	mtexColorMap LaboTeX 
	mtexColorbar('title','kernel average misorientation, degrees')
	hold on
	plot(grains.boundary,'lineWidth',1.5)
	hold off
	filename = strcat(output_path, '_KAM.png');
	saveFigure(filename)	
end

