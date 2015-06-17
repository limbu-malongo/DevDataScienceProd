## Illustrating inputs ui.R

shinyUI(pageWithSidebar(
  
  headerPanel("Height Prediction From Shoe Size"),
  
  sidebarPanel(
    
    helpText("This application predicts the height when supplied with shoe size in inches and gender.
              
              The backend of the application uses linear regression model"),
    
    # textInput('in_name', 'Your Name Please', value = "Name Please!"),
    
    numericInput('in_Shoe', 'Enter Your Shoe Size (in Inches)', 
                 4, min = 4, max = 16, step = 0.5),

    radioButtons(inputId="in_Gender", label="Select Your Gender", 
                 choices=c("F","M"), 
                 selected = "F")
    
    # actionButton("goButton", "Predict My Height!")
                         
      
  ),
  mainPanel(
    h3('Confirm Your Particulars'),
    p('Your Shoe Size is (in Inches):'),
    verbatimTextOutput("op_shoe"),
    p('Your Gender is:'),
    verbatimTextOutput("op_Gender"),
    h3('Your Predicted Height (in Inches):'),
    # verbatimTextOutput("op_name"),
    verbatimTextOutput("op_prediction"),
    uiOutput("op_repo"),
    uiOutput("op_paper")

  )
))
