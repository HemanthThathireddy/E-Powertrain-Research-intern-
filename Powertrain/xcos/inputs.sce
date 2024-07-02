//Battery specifications
data = csvRead("BatterySpecifications.csv")
//Battery capacity
Battery_cpacity = data(2,1) 
//Battery Initial soc 
ISOC = data(2,3)
//state of charge 
soc = data(2:11,4)
//votage 
voltage = data(2:11,5)
