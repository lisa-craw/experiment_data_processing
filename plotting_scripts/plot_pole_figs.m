% function to plot pole figures of microstructure dataset
% requires the function export_fig from the MATLAB File Exchange: https://au.mathworks.com/matlabcentral/fileexchange/23629-export_fig

function plot_pole_figs(input_path, output_path, num_points)
		load(input_path)
		%% scatter plot pole figure
		fig = newMtexFigure;

		h = [Miller(0,0,0,1,CS{2})];
		plotPDF(ebsd('ice').orientations,h,'points', num_points, 'antipodal', 'MarkerSize', 3, 'MarkerColor', 'k')
		%export_fig(strcat(output_path, '_scatter'), '-png')
		
		%% contour pole figure
		%figure
		%clf
		odf = calcODF(ebsd('ice').orientations,'halfwidth',15*degree);
		nextAxis
		plotPDF(odf,h,'antipodal','MarkerSize',5,'MarkerColor','b','points',num_points, 'contourf');
		cmocean('haline')
		caxis([0, 5])                     %set max value
		CLim(gcm,'equal');
		mtexColorbar('title','mud', 'Interpreter', 'latex')
		export_fig(strcat(output_path, '_contour'), '-png')
end
