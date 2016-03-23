# Power Series Stepwise Regression

## Requirements
- [R](https://www.r-project.org/): environment for statistical computing and graphics
- [car](https://cran.r-project.org/web/packages/car/): Companion to Applied Regression
- [gplot](https://cran.r-project.org/web/packages/gplots/index.html): Various R Programming Tools for Plotting Data
 
## Directions

After installing the required packaged, to use this code launch R and type:

source ('macluarin.R')

The file will read the default.dat file (an ascii file with data in an x y dy format) and using stepwise linear regressionwill pick the order of the Maclaurin sereis to fit the data using the [Akaiki Information Criterion](https://en.wikipedia.org/wiki/Akaike_information_criterion).

To avoid issues with the different types of sum of squares regression (commonly called Type I, II and III sum of squares), we recommend sorting the data (e.g. see [ge-lowQ2.dat](ge-lowQ2.dat)).   NOTE:  A magnet's hysterisis curve would be an example of data where order of the points is critially important.

### Example Results

As an example of the power of the technique, we use the data from Bevington and Robinson page 120 (default.dat) to show how the code correctly determines the correct order polynominal to use to discribe the data. 

The [ge-lowQ2.dat](ge-lowQ2.dat) and [ge-mainz14.dat](ge-mainz14.dat) files are used in the determination of the proton radius.

