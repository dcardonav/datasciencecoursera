Course Project
========================================================
author: David
date: March 18th
autosize: true

Online Linear Regression
========================================================

The allows the user to select several variables to determine the impact they have over the fuel consumption of vehicles. 

The variables that can be used are:

- Number of Cylinders
- Transmission Type
- Number of Gears
- Weight
- Number of Carburators
- Gross Horsepower

Data
========================================================

The data comes from the mtcars dataset that's included with base R. Here's the description of the data according to the R Documentation

"The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."

Results: Coefficients and Significance Values
========================================================

The app shows the coefficients of the fitted model and the p-values so the user can determine if the variable has a statistically significant impact on the fuel consumption


```
              Estimate Std. Error    t value     Pr(>|t|)
(Intercept) 35.2866335  6.7141336  5.2555751 1.714002e-05
cyl         -1.1382687  0.4988626 -2.2817281 3.093413e-02
am           1.5807120  1.7185772  0.9197795 3.661434e-01
gear         0.3583819  1.3856190  0.2586439 7.979466e-01
wt          -2.4089407  0.9901611 -2.4328775 2.216426e-02
carb        -0.8414235  0.5409481 -1.5554606 1.319262e-01
```

Results: Plotting
========================================================

Also the app plots the fitted values produced by the model vs. the real data from the dataset; obviously the results depend on the variables the user chooses

![plot of chunk unnamed-chunk-2](pitch-figure/unnamed-chunk-2-1.png)
