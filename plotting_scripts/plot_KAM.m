% function to plot kernel average misorientation map of high resolution EBSD maps (or low res, for that matter)

%test:
%plot_KAM('~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1.mat', '~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1')

function plot_KAM(input_path, output_path)
	load(input_path)
	ebsd = ebsd.gridify;
	% calculate mis2mean
%	kam = ebsd.KAM('threshold',2.5*degree)/degree;
	plot(ebsd, ebsd.KAM('threshold', 0.5*degree)./degree, 'micronbar', 'off')
	caxis([0,0.5])
	mtexColorMap LaboTeX 
%	cmocean algae	
	mtexColorbar('title','kernel average misorientation, degrees')
	hold on
	plot(grains.boundary,'lineWidth',2.5)
	hold off
	filename = strcat(output_path, '_KAM.png');
	saveFigure(filename)	
end

