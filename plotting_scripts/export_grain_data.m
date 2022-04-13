% function to load EBSD or FA data, and save a .csv file with grain size, orientation, sphericity.

%to test:
%input_path = 'LC032_EBSD/LC032_20micron_EBSD_smoothed.mat'; output_path = 'output/LC032_EBSD_grain_data'


function export_grain_data(input_path, output_path)
	load(input_path)
	grain_area = grains.area;
	equivalent_diameter = 2*equivalentRadius(grains);
	sphericity = grains.area./grains.perimeter('withInclusion')./grains.equivalentRadius;

	[longaxis_orientation, longaxis, shortaxis] = grains.fitEllipse;

	data = [grain_area equivalent_diameter sphericity longaxis_orientation];
	header = "grain_area_pixels, equivalent_diameter_microns,  sphericity, long_axis_orientation_deg_from_compression";
%	header = cell2mat(header);
	
%write grain data and header to .csv file
	filename = strcat(output_path, '.csv');
	fid = fopen(filename, 'w');
	fprintf(fid, '%s\n', header);
	fclose(fid);
	dlmwrite(filename, data, '-append');

% write grain orientation data to .mat file
%  matfilename = extractAfter(output_path, '/');
%  matfilepath = extractBefore(output_path, '_grain_data');
%  last_slash_pos = find(matfilepath == '/', 1, 'last');
%  matfilename = extractAfter(matfilepath, last_slash_pos);
%  eval(strcat(matfilename, '_orientations = grains.meanOrientation')); 
%  eval(strcat('save(''', matfilepath, '_orientations.mat'',''', matfilename, '_orientations'')')); 
end
