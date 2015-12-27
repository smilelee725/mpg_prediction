library(shiny)

## build a regression model to predict mpg, based on mtcars dataset
predict_mpg<-function(i_cyl = 6,i_hp = 110,i_wt = 3.0,i_am = 1){
    if(!(i_cyl %in% c(4,6,8))){
        stop("Invalid Cyl;Please choose from 4,6,8")
    }
    
    if(!(i_am %in% c(0,1))){
        stop("Invalid transmission type; 1 - Manual Transmission 2 - Automatic Transmission")
    }
    
    if(i_hp < 50 | i_hp > 400)
        stop("Horsepower out of range. Select between 50 and 400.")
    
    if(i_wt < 1 | i_wt > 10)
        stop("Weight out of range. Select between 1 and 10.")
    
    mtcars$cyl <- as.factor(mtcars$cyl)
    mtcars$am <- as.factor(mtcars$am)
    
    fit<-lm(mpg ~ cyl + hp + wt + am,data = mtcars)
    
    v<-data.frame(cyl = as.factor(i_cyl),hp = i_hp, wt = i_wt, am = as.factor(i_am))
    predict(fit,newdata = v)
    
}


shinyServer(

    function(input, output){
        
        
       output$o_mpg <- renderPrint({predict_mpg(input$cyl,input$hp,input$wt,input$am)})

    }
)