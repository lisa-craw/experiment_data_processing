This repository contains MATLAB scripts written for processing data from ice mechanics experiments performed in the Institute for Marine and Antarctic Studies Ice Mechanics Laboratory. They are designed to take raw data files containing temperature and displacement data, clean the data, calculate axial and octahedral strains and strain rates, and generate plots and other information relevant for glaciology research. 

Also contained in the directory /plotting_scripts/ are scripts to process and plot microstructural information from electron backscatter diffraction (EBSD) and fabric analyer (FA) analysis. 

All of these scripts were written and run using MATLAB 2018b.
---

###Data
Example datasets can be found at:

Craw, L., Treverrow, A., Fan, S., & Peternell, M. (2020). Mechanical and microstructural data
from ice deformation experiments with a change in temperature partway. Australian Antarctic Data
Centre. <https://doi.org/10.4225/15/58eedf0d72be9>

Craw, L., Treverrow, A., & Peternell, M. (2022). Mechanical and microstructural data from
deformation experiments on marine and meteoric ice from the Amery Ice Shelf [Data set]. Australian
Antarctic Data Centre. <https://doi.org/10.26179/vy30-tc66>

###Output
Processed data are presented in:

Craw, Lisa, Adam Treverrow, Sheng Fan, Mark Peternell, Sue Cook, Felicity McCormack,
and Jason Roberts. The temperature change shortcut: Effects of mid-experiment temperature
changes on the deformation of polycrystalline ice. The Cryosphere, 15:1–21, 2021.

###Where to start?

Start with the script experiment_data_process.m, which calls each data processing function in turn, saving the output periodically.

###Questions?

Feel free to contact me at lisa.craw@utas.edu.au.
