#
# Maclaurin Series Stepwise Regresion Model
# by Douglas Weadon Higinbotham, Jefferson Lab
#
message("")
message("Maclaurin Series Stepwise Model Selection")
message("")
#
# Load the car library for the ellipses.
# Load the gplots library for text on plot
#
library(car)
library(gplots)
#
# Choosing the order of polynominal to fit a given set of data and
# producing the resulting confience ellipses of the first two parameters
# at the 0.68268, 0.95450, 0.99730, 0.999936, 0.999999.
#
# Code assumes reads in data in an x y dy format.
#
# Use the Akaike information criterion (AIC) to measure the relative quality 
# of statistical models for a given set of data.  Since AIC estimates the quality 
# of each model, AIC provides a tool for model selection even for non-nested 
# models.
#
# In this code,  we make use of the Akaike information criterion to decide 
# the Maclaurin series to use for describing a given set of data.   
#
# Read the data
#
#data <- read.table("ge-mainz14.dat", header=TRUE ,  col.names = c("q2", "Ge", "dGe"))
data <- read.table("ge-mainz14.dat", header=TRUE ,  col.names = c("x", "y", "dy"))
#data <- read.table("default.dat", header=TRUE,  col.names = c("x", "y", "dy"))
#attach(data)
#data <- read.table("ge.dat", header=FALSE ,  col.names = c("q2", "Ge", "dGe"))
#data <- read.table("bevington.dat", header=FALSE ,  col.names = c("q2", "Ge", "dGe"))
#
# Define the mininum model.
#
min.model <- lm(data$y ~ data$x, weight=1/data$dy^2)
#min.model <- lm(y ~ x, weight=1/dy^2)
#
# Define a high order Maclaurin series to be used as a forward model.  
#
fwd.model <- step(min.model, direction="forward", scope=( ~ data$x +I(data$x^2) +I(data$x^3) +I(data$x^4) +I(data$x^5) +I(data$x^6)  +I(data$x^7) +I(data$x^8) +I(data$x^9) +I(data$x^10) +I(data$x^11) ))
#message="calc. forward model"
#fwd.model <- step(min.model, direction="forward", scope=( ~ x +I(x^2) +I(x^3) +I(x^4) +I(x^5) +I(x^6)  +I(x^7) +I(x^8) +I(x^9) +I(x^10) +I(x^11) ))
#
# Print the function that passes our significance test.
#
message("")
message('Akaike Information Criterion Selected Model')
print(summary(fwd.model))
#
# Pick which indices to use in the ellipse.  By default we have set this to slope and intercept.
#
which.coef <-c(1,2)
#
# Plot the multivarient confidence ellipses.
#
gray.colors(12, start = 0.1, end = 0.9, gamma = 1.2, alpha = NULL)
#
#
#
par(mfrow=c(2,2))
plot(data$x,data$y,xlab="x",ylab="y")

arrows(data$x,data$y-data$dy, data$x, data$y+data$dy, length=0.05, angle=90, code=3)

lines(data$x,predict(fwd.model))
plot(data$x,data$y-predict(fwd.model),ylim=range(c(data$y-data$dy-predict(fwd.model), data$y+data$dy-predict(fwd.model))),xlab="x",ylab="Residual")
arrows(data$x,(data$y-data$dy)-predict(fwd.model), data$x, (data$y+data$dy)-predict(fwd.model), length=0.05, angle=90, code=3)
abline(0,0)
#
# One Thru Five Sigma Confidence Ellipses
#
confidenceEllipse(fwd.model,which.coef,level=0.999999,xlab="Intercept Coefficient",ylab="Slope Coefficient",col="gray90")
confidenceEllipse(fwd.model,which.coef,level=0.999936,xlab="Intercept Coefficient",ylab="Slope Coefficient",add=TRUE,col="gray70")
confidenceEllipse(fwd.model,which.coef,level=0.99730,xlab="Intercept Coefficient",ylab="Slope Coefficient",add=TRUE,col="gray60")
confidenceEllipse(fwd.model,which.coef,level=0.95450,xlab="Intercept Coefficient",ylab="Slope Coefficient",add=TRUE,col="gray40")
confidenceEllipse(fwd.model,which.coef,level=0.68268,xlab="Intercept Coefficient",ylab="Slope Coefficient",add=TRUE,col="gray20")
#
# Plot Information About The Final Fit
#
textplot (capture.output(summary(fwd.model)), valign="top")
