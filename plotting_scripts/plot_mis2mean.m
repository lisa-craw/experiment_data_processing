% function to plot misorientation to mean map of high resolution EBSD maps (or low res, for that matter)

function plot_mis2mean(input_path, output_path)
	load(input_path)
	% calculate mis2mean
	mis2mean = calcGROD(ebsd, grains)
	plot(ebsd, mis2mean.angle./degree)
	caxis([0,15])
	mtexColorMap LaboTeX
	%cmocean('haline')
	mtexColorbar('title','misorientation to mean, degrees')
	hold on
	plot(grains.boundary,'lineWidth',1.5)
	hold off
	filename = strcat(output_path, '_mis2mean.png') 
	saveFigure(filename)
end

