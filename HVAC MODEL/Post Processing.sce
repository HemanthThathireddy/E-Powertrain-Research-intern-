//Post Processing
scf(0)
H_VL_P = H_MBL_E.values./Heater_E.values
plot(Heater.time,H_VL_P*100)
