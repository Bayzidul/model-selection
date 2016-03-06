# Power Series Stepwise Regression

To use this code launch R and type:

source ('macluarin.R')

The file will read the default.dat file (an ascii file with data in an x y dy format) and using stepwise linear regressionwill pick the order of the Maclaurin sereis to fit  the data using the [Akaiki Information Criterion](https://en.wikipedia.org/wiki/Akaike_information_criterion).

To avoid issues with the different types of sum of squares regression (commonly called Type I, II and III sum of squares), we recommend sorting the data (e.g. see [ge-lowQ2.dat](ge-lowQ2.dat)).

