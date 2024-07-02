//Importing the efficiency values
value  = csvRead("Motor Efficiency Data Less Points.csv")
Ns = value(2:29,1)
Nt = value(2:29,2)
Ne = value(2:29,3)
Ne = Ne*100
NE = string(Ne)
scf(0)
xstring(Ns,Nt,NE)
scatter(Ns,Nt,Ne,"red")

//Plotting Motor Operating Points
scatter(Ms.values,Mt.values)

//Plotting motor efficiency operating points 
scf(1)
scatter3d(Ms.values,Mt.values,Me.values)
xlabel("Motor Speed (rpm)")
ylabel("Motor Torque (Nm)")
zlabel("Motor Efficiency (%)")

title("Motor Efficiency Operating Points")

//Motor Characteristics data
NLC = csvRead("Nissan Leaf MC.csv")
NLS = NLC(3:139,1)
NLPT = NLC(3:139,2)
NLCT = NLC(3:139,3)
scf(2)
plot(NLS,NLPT,"red")
plot(NLS,NLCT,"green")
//Plotting Motor Operating Points
scatter(Ms.values,Mt.values)
xstring(1000,max(NLPT),"Peak Torque")
xstring(1000,max(NLCT),"Continuous Torque")
xlabel("Motor Speed (rpm)")
ylabel("Motor Torque (Nm)")
title("Motor Operating Points")
scatter(Ns,Nt,Ne,"red")
xstring(Ns,Nt,NE)

//Motor Average efficiency value for the drive cycle
 

disp(mean(Me.values))

//Motor Efficiency Operating Points as a 3d graph
scf(3)
surf(s,t,e)
scatter3d(Ms.values,Mt.values,Me.values)
xlabel("Motor Speed (rpm)")
ylabel("Motor Torque (Nm)")
zlabel("Motor Efficiency (%)")
title("Motor Efficiency Operating Points")
// importing N L C D
scf(4)
NLCD = csvRead("NL Cell Data.csv")
NLV = NLCD (2:5216,2)
NLSOC = NLCD (2:5216,3)
plot(NLSOC,NLV)
xlabel("Cell state of charge")
ylabel("Cdell terminal voltage ")
title("voltage")
