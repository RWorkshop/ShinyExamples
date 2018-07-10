library(shiny)
 
shinyServer(function(input, output) { 
  
  output$textDisplay <- renderTable({ 
                                     
  getMat = matrix(c(
    paste("The value is ", input$NewVal,
          "The class is ", class(input$NewVal),
           "The square root is ", sqrt(as.numeric(input$NewVal)) )  , ncol=2, byrow = TRUE)
 
    colnames(getMat) = c("Item", "Value")
    
    getMat
 
  })
})

