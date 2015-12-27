library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("MPG Prediction"),
    
    sidebarPanel(
        p('User Guide'),
        p('This application shall be used to predict MPG for your car. The prediction model is based
          on mtcars dataset. In the below section please specify the horsepower, weight, # of cylinders,
          and transmission type of your car. You will see the MPG prediction on the right side.'),
        
        h3("Specify the configuration of your car"),
        numericInput('hp','Specify horsepower',100,min = 30,max = 400, step = 10),
        numericInput('wt','Specify weight (lb/1000)',2.5,min = 1,max = 10, step = 0.5),
        radioButtons('cyl',"Specify # of cylinders",c("4" = '4',"6" = '6',"8" = '8')),
        radioButtons('am',"Specify transmission type (1 = manual 0 = automatic) ",c("Manual" = '1',"Automatic" = '0')),

        submitButton('Get MPG!') 
    ),
    mainPanel(
        h3("MPG for your car is"),
        verbatimTextOutput("o_mpg")

    )
))