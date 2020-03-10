Hp        = 6060 %ft
Mach      = 10
fuelleft  = 400
fuelright = 300
Delta_T   =  10

fileID = fopen('matlab.dat','w');
fprintf(fileID,"Hp,Mach,fuelleft,fuelright,Delta_T");

fclose(fileID);
