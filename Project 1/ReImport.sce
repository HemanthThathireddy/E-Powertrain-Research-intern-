//Importing Drive CYcle Data
data = csvRead("UDDS.csv")
UDDS.time = data(4:1372,1)
UDDS.values = data(4:1372,2)

//Importing Motor Efficiency Data
ME=csvRead("Motor Efficiency.csv")
//Motor Speed
s = ME(2:11,1)
t = ME(2:11,12)
e = ME(2:11,2:11)
subplot(221)
surf(s,t,e)
xlabel("Motor Speed (rpm)")
ylabel("Motor Torque (Nm)")
zlabel("Motor Efficiency (%)")
title("Motor Efficiency Map")

//Importing Regenrative Motor Efficiency
MRE=csvRead("Motor Regenerative Efficiency.csv")
//Motor Speed
sr = MRE(2:11,1)
tr = MRE(2:11,12)
er = MRE(2:11,2:11)
subplot(222)
surf(sr,tr,er) 
xlabel("Motor Speed (rpm)")
ylabel("Motor Regenerative Torque (Nm)")
zlabel("Motor Regenerative Efficiency (%)")
title("Motor Regenerative Efficiency Map")
