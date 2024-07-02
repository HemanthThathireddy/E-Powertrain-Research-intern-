//Importing Drive_cycle data
data = csvRead("Nissan Leaf Acceleration Data.csv")
//Drive_cycle data
Drive_cycle.time = data(3:117,1)
Drive_cycle.values = data(3:117,2)
