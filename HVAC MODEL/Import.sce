//Importing Drive CYcle Data
data = csvRead("UDDS.csv")
UDDS.time = data(4:1372,1)
UDDS.values = data(4:1372,2)
//impoting motor efficiency Data
ME = csvRead("M E.csv")
//motor speed
s = ME(2:16,1)
t = ME(2:16,17)
e = ME(2:16,2:16)
scf(0)
subplot(221)
surf(s,t,e)
xlabel("Motor Speed(rpm)")
ylabel("Motor Torque(Nm)")
zlabel("Motor Efficiency (%)")
title("Motor Efficiency Plot")
//Importing Regenerayive motor Data
MRE = csvRead("M Re.csv")
//motor speed
sr = MRE(2:16,1)
tr = MRE(2:16,17)
er = MRE(2:16,2:16)
subplot(222)
surf(sr,tr,er)
xlabel("Motor Speed(rpm)")
ylabel("Motor Regenerayive Torque(Nm)")
zlabel("Motor Regenerayive Efficiency (%)")
title("Motor Regenerayive Efficiency Plot")
MRE = csvRead("M Re.csv")
//Motor Efficiciency Operating points as a 3D
//Importing motor controller eff data
MCE = csvRead("MC E.csv")
scr = MCE(2:16,1)
sct = MCE(2:16,17)
sce = MCE(2:16,2:16)
subplot(223)
surf(scr,sct,sce)
xlabel("Motor Speed(rpm)")
ylabel("Motor Torque(Nm)")
zlabel("Motor Efficiency (%)")
title("Motor Efficiency Plot")
MCRE = csvRead("MC RE.csv")
scrr = MCRE(2:16,1)
scrt = MCRE(2:16,17)
scre = MCRE(2:16,2:16)
subplot(224)
surf(scrr,scrt,scre)
xlabel("Motor Speed(rpm)")
ylabel("Motor Regenerayive Torque(Nm)")
zlabel("Motor Regenerayive Efficiency (%)")
title("Motor Regenerayive Efficiency Plot")
//importing NL Cell data
NLCD = csvRead("NL Cell Data.csv")
NLV = NLCD (2:5216,2)
NLSOC = NLCD (2:5216,3)
scf(1)
plot(NLSOC,NLV)
xlabel("Cell state of charge")
ylabel("Cdell terminal voltage ")
title("voltage")
//Import Thermal Conductivity variation with velocity
data1 = csvRead("BTC.csv")
velocity = data1(1,2:7)
conductivity = data1(2,2:7)

//Vehicle Parameters
//Vehicle Dynamics 
//Radius of the wheel
Rw = 0.2032//m
//Coefficient of rolling resistance
Crf=0.015
//Gross Vehicle Mass
GVM= 1704.5 //Kg
//Gross vehicle Weight
GVW=GVM*9.81 //N
//Area
A = 2.276
//Coefficient of Drag
Cd = 0.29
//Air density
rho = 1.225 //kg/m^3
//Transmission
//Gear Ratio
Gear_ratio = 7.938
//Transmission Efficiency
Neff = 0.97
//Battery Energy
BE = 24000 //Wh

//HVAC
//Ambient Temperature
T_amb = [-30,-20,-10,0,10,20]
//Coefficient of Performance
COP = 1.4
//Mass of air in the cabin
M_a = 3.185 //Volume ofcabin*density of air = 2.6*1.225
//Air Specific Heat Capacity 
c = 1350
//Cabin temperature required
Tc = 20

//Area of vehicle without glass
Av = 7.87
//Solar Direct Radiation (W/m^2)
R_solar = 0
//Area of vehicle window
A_w = 1.73
//Surface element transmissivity
Tran_s = 0.4

//Initial Cabin Temperature
T_i = [-30,-20,-10,0,10,20]
T_s = string(T_i)

//Simulation time
Tsim = UDDS.time($)

//Change the location in the below line
importXcosDiagram("C:\Users\Bharath Kumar P\Desktop\HVAC MODEL\HVAC single speed Transmission.zcos")
typeof(scs_m)
//Definig empty matrices
SOC_data = ([])
Heater_data = ([])
Cabin_temp_data = ([])
Power_E = ([])
E_C_perkm_data = ([])
Range = ([])

//Heater
HBCL = ([])
HMBl = ([])
HVL = ([])
for i = 1:length(T_i)
    Ti = T_i(i)
    Tamb = T_amb(i)
    xcos_simulate(scs_m, 4)
    //State of Charge
    SOC_data(:,i) = SOC.values
    
    //Heater Energy Consumption
    Heater_data(:,i) = abs(Heater_E.values)
    
    //Cabin Temperature
    //Cabin_temp_data(:,i) = Cabin.values
    
    //Heater
    HBCL(i) = H_BC_E.values(Tsim)
    HMBl(i) = H_MBL_E.values(Tsim)
    HVL(i) = H_VL_E.values(Tsim)
    
    //Powertrain
    Power_E(i) = Powertrain.values(Tsim)
    E_C_perkm_data(i) = E_C_perkm.values(Tsim)
    
    //Vehicle Range
    Range(i) = BE/E_C_perkm.values(Tsim)
end
T_amb_s = string(T_amb)
T_s = string(T_i)
scf(2)
plot(SOC.time,SOC_data)
s = ([])
for j = 1:length(T_amb)
    s(j) = "Ambient Temperature "+T_amb_s(j)
end
xtitle('State of Charge','Temperature [C]','State of Charge (%)')
legend(s)

scf(3)
plot(Heater.time,Heater_data)
xtitle('Heater Energy','time (s)','Heater Energy Consumed (Wh)')
legend(s)
/*
scf(4)
plot(Cabin.time,Cabin_temp_data)
xtitle('Cabin Temperature','time (s)','Cabin Temperature [C]')
legend(s)
*/

//Heater Plot
scf(5)
bar(T_amb,[HBCL,HMBl,HVL],'stacked')
legend('Body Conduction Load','Metabolic Heat Load','Ventilation Load')
xtitle('Heater Loads','Ambient Temperature [C]','Energy Consumed [Wh]')

//Total Energy Consumption
scf(6)
bar(T_i,[Power_E,HBCL,HMBl,HVL],'stacked')
legend('Powertrain Energy','Body Conduction Load','Metabolic Heat Load','Ventilation Load')
xtitle('Electric Vehicle Energy Consumption','Ambient Temperature [C]','Energy Consumed [Wh]')

//Vehicle Range
scf(7)
scatter(T_amb,Range',['red','blue','green','black','violet','yellow'])
xstring(T_amb,Range',T_amb_s+"")
xtitle('Vehicle Range','Ambient Temperature [C]','Vehicle Range (Km)')
replot([-35,90,25,180])
