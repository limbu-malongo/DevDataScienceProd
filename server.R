## server.R

library(readxl)

shoedata <- read_excel("shoesize.xls")
shoedata$Gender <- factor(shoedata$Gender)
shoe.fit <- lm(Height ~ Size + Gender, data = shoedata)

shinyServer(

  function(input, output) {
    

    output$op_shoe <- renderText({input$in_Shoe})
    output$op_Gender <- renderText({input$in_Gender})
    # output$op_name <- renderText({input$in_name})
    
    output$op_prediction <- renderText({
      
      inputdata = data.frame(Gender = input$in_Gender, Size = input$in_Shoe)
     
      round(predict(shoe.fit, newdata = inputdata),2)
       
      })
    
  }
)