library(shiny)

shinyServer(function(input, output) {

  
  NewValChars <- reactive({
    
    # Perform calculations
    
    I = as.numeric(input$Iters)
    S = as.numeric(input$Sides)	
    DiceDat = floor(runif(I,1,(S+1)))


    # Compose data frame
    data.frame(
      Name = c("Sum","Mean","Median"),
      Value = as.character(c(sum(DiceDat),
                             mean(DiceDat),
                             median(DiceDat)
                             
                             )), 
      stringsAsFactors=FALSE)
  }) 

  # Show the values using an HTML table
  output$values <- renderTable({
    NewValChars()
  })
})