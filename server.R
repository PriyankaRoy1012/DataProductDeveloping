

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model1 <- lm(mpg ~ hp, data = mtcars)
  model2 <- lm(mpg ~ wt, data = mtcars)
  
  modelPred1 <- reactive({
    hpInput <- input$sliderHP
    predict(model1, newdata = data.frame(hp = hpInput))
  })
  
  modelPred2 <- reactive({
    wtInput <- input$sliderWT
    predict(model2, newdata = data.frame(wt = wtInput))
  })
  
  output$pred1 <- renderText({modelPred1()})
  output$pred2 <- renderText({modelPred2()})
  
  output$plot1 <- renderPlot({
    hpInput <- input$sliderHP
    wtInput <- input$sliderWT
    
    if(input$showModel1){
      plot(mtcars$hp, mtcars$mpg, xlab= "Horesepower", ylab= "miles per gallon")
      abline(model1, col = "red", lwd =2)
      points(hpInput, modelPred1(), col = "red", pch =16) 
    }
    if(input$showModel1 == FALSE){
      plot(mtcars$wt, mtcars$mpg, xlab= "weight", ylab= "miles per gallon")
      abline(model2, col = "red", lwd =2)
      points(wtInput, modelPred2(), col = "red", pch =16) 
    }
    
  })
  
})


