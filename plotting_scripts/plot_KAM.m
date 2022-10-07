% function to plot misorientation to mean map of high resolution EBSD maps (or low res, for that matter)

%plot_KAM('~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1.mat', '~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1')

function plot_KAM(input_path, output_path)
	load(input_path)
	ebsd = ebsd.gridify;
	% calculate mis2mean
%	kam = ebsd.KAM('threshold',2.5*degree)/degree;
	plot(ebsd, ebsd.KAM('threshold', 2.5*degree)./degree)
	caxis([0,0.5])
	mtexColorMap LaboTeX 
%	mtexColorMap WhiteJetColorMap 
	mtexColorbar('title','kernel average misorientation, degrees')
	hold on
	plot(grains.boundary,'lineWidth',1.5)
	hold off
	filename = strcat(output_path, '_KAM.png');
	saveFigure(filename)	
end

