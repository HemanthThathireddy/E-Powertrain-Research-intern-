//post processing
//input current 
scf(0)
plot(value.time,value.values(1:3142,1))
xlabel("time [s]")
ylabel("discharge current [A]")
title("Discharge current plot")
scf(1)
//voltage
plot(value.time,value.values(1:3142,2))
xlabel("time [s]")
ylabel("voltage [v]")
title("Battery voltage plot")
scf(2)
plot(value.time,value.values(1:3142,3))
xlabel("time [s]")
ylabel("SOC [%]")
title("Battery SOC plot")
