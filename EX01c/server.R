library(shiny)

shinyServer(function(input, output) {

  # Reactive expression to compose a data frame containing all of the values
  NewValChars <- reactive({

    # Compose data frame
    data.frame(
      Name = c("Value", 
               "Class",
               "Square Root",
               "Log (base10)"
               ),
      Value = as.character(c(input$NewVal, 
                             class(input$NewVal),
                             sqrt(as.numeric(input$NewVal)),
                             log(as.numeric(input$NewVal),10)
                             )), 
      stringsAsFactors=FALSE)
  }) 

  # Show the values using an HTML table
  output$values <- renderTable({
    NewValChars()
  })
})