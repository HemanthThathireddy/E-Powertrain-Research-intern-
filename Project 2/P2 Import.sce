//Importing Drive CYcle Data
data = csvRead("Drive Cycle 1.csv")
BUS.time = data(2:1909,1)
BUS.values = data(2:1909,2)
//impoting motor efficiency Data
//ME = csvRead("M E.csv")
//motor speed
//s = ME(2:16,1)
//t = ME(2:16,17)
//e = ME(2:16,2:16)
//subplot(221)
//surf(s,t,e)
//xlabel("Motor Speed(rpm)")
//ylabel("Motor Torque(Nm)")
//zlabel("Motor Efficiency (%)")
//title("Motor Efficiency Plot")
//Importing Regenerayive motor Data
//MRE = csvRead("M Re.csv")
//motor speed
//sr = MRE(2:16,1)
//tr = MRE(2:16,17)
//er = MRE(2:16,2:16)
//subplot(222)
//surf(sr,tr,er)
//xlabel("Motor Speed(rpm)")
//ylabel("Motor Regenerayive Torque(Nm)")
//zlabel("Motor Regenerayive Efficiency (%)")
//title("Motor Regenerayive Efficiency Plot")
//MRE = csvRead("M Re.csv")
//Motor Efficiciency Operating points as a 3D
//Importing motor controller eff data
//MCE = csvRead("MC E.csv")
//scr = MCE(2:16,1)
//sct = MCE(2:16,17)
//sce = MCE(2:16,2:16)
//subplot(223)
//surf(scr,sct,sce)
//xlabel("Motor Speed(rpm)")
//ylabel("Motor Torque(Nm)")
//zlabel("Motor Efficiency (%)")
//title("Motor Efficiency Plot")
//MCRE = csvRead("MC RE.csv")
//scrr = MCRE(2:16,1)
//scrt = MCRE(2:16,17)
//scre = MCRE(2:16,2:16)
//subplot(224)
//surf(scrr,scrt,scre)
//xlabel("Motor Speed(rpm)")
//ylabel("Motor Regenerayive Torque(Nm)")
//zlabel("Motor Regenerayive Efficiency (%)")
//title("Motor Regenerayive Efficiency Plot")
//importing NL Cell data
//NLCD = csvRead("NL Cell Data.csv")#/
