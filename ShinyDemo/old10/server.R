library(shiny)

shinyServer(function(input, output) {
    output$mytable = renderTable({
      iris
    })
})