#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict MPG using Horsepower and Weight separately"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h4("Intoduction"),
      h6("The application uses dataset mtcars. Here an effort had been made to forecast 
         the fuel consumption (mpg) using horsepower and weight of the cars in two separate models."),
      h6("Model1 takes horesepower as input and Model2 takes weight as input. Simple linear regression 
         is used as a technique for this exercise."),
      sliderInput("sliderHP","What is the horsepower of the car?", 50,350, value = 60),
      sliderInput("sliderWT", "what is the weight of the car?", 1,6, value = 3.4),
      checkboxInput("showModel1","Tick to see model 1, Untick to see Model 2", value = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1"),
       h3("Predicted MPG using Model 1 (using horsepower)"),
       textOutput("pred1"),
       h3("Predicted MPG using Model 2 (using weight)"),
       textOutput("pred2")
    )
  )
))
