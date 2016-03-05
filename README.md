# Model Selection
Tools for the selection of a statistical model from experimental data. 

## Stepwise Regression

While no model selection criteria is perfect, making use of the avaliable statistical
tools allows a researcher to systematically choose a set of predictive variables for a 
given set of data and critiria.  The selection process can be done by an autmoatic 
procedure in the form of a sequence of tests such as F-tests or making use of the Akaike information criterion.

As [George Box](https://en.wikipedia.org/wiki/George_E._P._Box) noted,  "The most that can be expected from any model is that it can 
supply a useful approximation to reality: All models are wrong; some models are useful".

## Requirements
- [R](https://www.r-project.org/): environment for statistical computing and graphics
- [car](https://cran.r-project.org/web/packages/car/): Companion to Applied Regression
- [gplot](https://cran.r-project.org/web/packages/gplots/index.html): Various R Programming Tools for Plotting Data

## References

```bibtex
@Manual{R,
title = {R: A Language and Environment for Statistical Computing},
author = {{R Core Team}},
organization = {R Foundation for Statistical Computing},
address = {Vienna, Austria},
year = {2013},
note = {{ISBN} 3-900051-07-0},
url = {http://www.R-project.org/},
}
```

```bibtex
@Book{car,
title = {An {R} Companion to Applied Regression},
edition = {Second},
author = {John Fox and Sanford Weisberg},
year = {2011},
publisher = {Sage},
address = {Thousand Oaks {CA}},
url = {http://socserv.socsci.mcmaster.ca/jfox/Books/Companion},
}
```
