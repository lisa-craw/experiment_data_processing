% function to plot misorientation to mean map of high resolution EBSD maps (or low res, for that matter)

%test:
%plot_mis2mean('~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1.mat', '~/experimental_data/EBSD_data/hi_res/LC029_hires1/LC029_hires1')


function plot_mis2mean(input_path, output_path)
	load(input_path)
	% calculate mis2mean
	mis2mean = calcGROD(ebsd, grains)
	plot(ebsd, mis2mean.angle./degree, 'micronbar', 'off')
	caxis([0,15])
	%mtexColorMap LaboTeX

	%generate white to orange colormap {{{
	vec = [      100;       0];
	hex = ['#ffffff';'#f08700'];
	raw = sscanf(hex','#%2x%2x%2x',[3,size(hex,1)]).' / 255;
	N = 128;
	orange_map = interp1(vec,raw,linspace(100,0,N),'pchip');
	%}}}

	colormap(orange_map) 
	mtexColorbar('title','misorientation to mean, degrees')
	hold on
	plot(grains.boundary,'lineWidth',2.5)
	hold off
	filename = strcat(output_path, '_mis2mean.png') 
	saveFigure(filename)
end

