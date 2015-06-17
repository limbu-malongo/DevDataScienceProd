# This is a Project Assgnment Part of Coursera Course June 2015

# Developing Data Science Products

# =============================================================================

# Your Shiny Application
# 1. Write a shiny application with associated supporting documentation. 
# The documentation should be
# thought of as whatever a user will need to get started using your application.
# 2. Deploy the application on Rstudio's shiny server
# 3. Share the application link by pasting it into the text box below
# 4. Share your server.R and ui.R code on github

# ==============================================================================

# This peer assessed assignment has two parts. First, you will create a Shiny 
# application and deploy it on Rstudio's servers. Second, you will use Slidify 
# or Rstudio Presenter to prepare a reproducible pitch
# presentation about your application.


# Inspired by the following article

# Using the Height and Shoe Size Data to Introduce Correlation and
# Regression by Constance H. McLaren which is found at the following url

# http://www.amstat.org/publications/jse/v20n3/mclaren.pdf

# Data url
# http://www.amstat.org/publications/jse/v20n3/mclaren/shoesize.xls

# Data documentation url
# http://www.amstat.org/publications/jse/v20n3/mclaren/documentation.doc

# =================================================================================

# Shiny application URL

# https://limbu.shinyapps.io/shoesize_v2

# ==================================================================================

# install.packages("readxl")
library(readxl)
shoedata <- read_excel("shoesize.xls")

# Exploring the data 
head(shoedata)
str(shoedata)

summary(shoedata)

hist(shoedata$Height)
hist(shoedata$Size)

# Change the variable Gender to factor
shoedata$Gender <- factor(shoedata$Gender)


# Builfing the model

shoe.fit <- lm(Height ~ Size + Gender, data = shoedata)

summary(shoe.fit)

# Testing the prediction of the model

inputdata1 = data.frame(Gender = "M", Size = 10)
round(predict(shoe.fit, newdata = inputdata1),2)

inputdata2 = data.frame(Gender = "F", Size = 10)
round(predict(shoe.fit, newdata = inputdata2),2)

# Dotplot for model coefficients
# install.packages("coefplot")
library(coefplot)
coefplot.lm(shoe.fit)
