Title: 1985 Auto Imports Database

Source Information:
   -- Creator/Donor: Jeffrey C. Schlimmer (Jeffrey.Schlimmer@a.gp.cs.cmu.edu)
   -- Date: 19 May 1987
   -- Sources:
     1) 1985 Model Import Car and Truck Specifications, 1985 Ward's
        Automotive Yearbook.
     2) Personal Auto Manuals, Insurance Services Office, 160 Water
        Street, New York, NY 10038 
     3) Insurance Collision Report, Insurance Institute for Highway
        Safety, Watergate 600, Washington, DC 20037
Number of Instances: 205
Number of Attributes: 26 total

###Data Information
| Attribute(Variable) | Range | Discription | class of variable | Data Type |
| ------------- | ------------- | ------------- | ------------- |------------- | ------------- |
| symboling  |         -3, -2, -1, 0, 1, 2, 3| A value of +3 indicates that the auto is risky, -3 that it is probably pretty safe| quantitative| double|
| normalized-losses | continuous from 65 to 256| XXXX| quantitative | Double|
| make |              alfa-romero, audi, bmw, chevrolet, dodge, honda, isuzu, jaguar, mazda, mercedes-benz, mercury,mitsubishi, nissan, peugot, plymouth, porsche,renault, saab, subaru, toyota, volkswagen, volvo| The brand of the car | qualitative | character |
| fuel-type |         diesel, gas | Different types of materials to produce energy for cars | qualitative | character |
| aspiration|         std, turbo | XXX | qualitative | character |
| num-of-doors|       four, two| Numbers of doors of the car | quantitative| character |
| body-style|         hardtop, wagon, sedan, hatchback, convertible| Shape and model of a particular automobile make | qualitative | character |
| drive-wheels|      4wd, fwd, rwd| Wheel of a motor vehicle that transmits force, transforming torque into tractive force from the tires to the road, causing the vehicle to move|qualitative | character |            
| engine-location |front, rear|Where the engine locates|qualitative | character |
| wheel-base|       continuous from 86.6 120.9 |Distance between the centers of the front and rear wheels | quantitative| double |
| length|           continuous from 141.1 to 208.1| The length of the car |  quantitative| double |
| width|            continuous from 60.3 to 72.3| The width of the car |  quantitative| double |
| height|           continuous from 47.8 to 59.8| The height of the car |  quantitative| double |
| curb-weight|      continuous from 1488 to 4066| Total weight of a vehicle with standard equipment|quantitative| integer |
| engine-type|      dohc, dohcv, l, ohc, ohcf, ohcv, rotor| where fuel, air, pressure, and electricity come together to create the small explosion that moves the car's pistons up and down, thus creating the power to move the vehicle|qualitative | character |
| num-of-cylinders| eight, five, four, six, three, twelve, two| Numbers of cylinders| quantitative|character|
| engine-size|     continuous from 61 to 326| The size(How big) is the engine| quantitative|integer|
| fuel-system|  1bbl, 2bbl, 4bbl, idi, mfi, mpfi, spdi, spfi| What responsible for delivering fuel to the engine as needed| qualitative|character |
| bore| continuous from 2.54 to 3.94|Size of the cylinder in a piston travels. Used for establish the displacement of an engine|quantitative|double|
| stroke|               continuous from 2.07 to 4.17|Full travel of the piston along the cylinder| quantitative|double|
| horsepower|           continuous from 48 to 288|The power an engine produces| quantitative|integer|
| peak-rpm|             continuous from 4150 to 6600| Highest revolutions per minute| quantitative|integer|
| city-mpg|             continuous from 13 to 49|The miles per gallon that allows a car to travel in the city| quantitative|integer|
| highway-mpg|          continuous from 16 to 54|The miles per gallon that allows a car to travel on freeway| quantitative|integer|
| price|                continuous from 5118 to 45400| $ Money cost| quantitative|integer|



###Missing Value
   |Attribute |  Number of instances missing a value|
   | ------------- | ------------- |  
   |normalized_losses |  41|
   | num_of_doors     |   2|
   | bore             |   4|
   |stroke            |   4|
   |horsepower        |   2|
   | peak_rpm         |   2|
   |price             |   4|
