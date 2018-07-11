library(shiny)

shinyServer(function(input, output) {

  # Reactive expression to compose a data frame containing all of the values
  NewValChars <- reactive({

    # Compose data frame
    data.frame(
      Name = c("Value 1", "Value 2","Sum","Product","Ratio" ),
      Value = as.character(c(input$Val1,input$Val2,  
                             as.numeric(input$Val1)+as.numeric(input$Val2),
                             as.numeric(input$Val1)*as.numeric(input$Val2),
                             as.numeric(input$Val1)/as.numeric(input$Val2)
                             )), 
      stringsAsFactors=FALSE)
  }) 

  # Show the values using an HTML table
  output$values <- renderTable({
    NewValChars()
  })
})