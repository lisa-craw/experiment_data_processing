% function to calculate and plot geometrically necessary dislocations from EBSD data. Following the tutorial at https://mtex-toolbox.github.io/GND.html, based on Pantleon, 2008

%test case:
load('~/experimental_data/EBSD_data/AM04_450/AM04_450_ebsd_smoothed.mat')
% colorscale according to mis2mean
ipfKey = axisAngleColorKey(ebsd('indexed'));
ipfKey.oriRef = grains(ebsd('indexed').grainId).meanOrientation;
%plot mis2mean data, with grain boundaries
plot(ebsd('indexed'),ipfKey.orientation2color(ebsd('indexed').orientations),'micronBar','off','figSize','medium')
hold on
plot(grains.boundary,'linewidth',2)
hold off

ebsd = ebsd('indexed').gridify;
% compute the curvature tensor
kappa = ebsd.curvature

% plot all three components of the curvature tensor
newMtexFigure('nrows',3,'ncols',3);
for i = 1:3
  for j = 1:3
    nextAxis(i,j)
    plot(ebsd,kappa{i,j},'micronBar','off')
    hold on; plot(grains.boundary,'linewidth',2); hold off
  end
end
setColorRange([-0.0001,0.0001])
drawNow(gcm,'figSize','large')

% get dislocation density tensor
alpha = kappa.dislocationDensity

dS = dislocationSystem.hcp(ebsd.CS);
