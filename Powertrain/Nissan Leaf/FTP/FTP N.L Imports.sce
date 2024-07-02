//Importing Drive cycle data
data = csvRead("FTP 75.csv")
//Drive cycle data
Drive_cycle.time = data(3:1877,1)
Drive_cycle.values = data(3:1877,2)
