library(shiny)


shinyUI(basicPage(
    h3("The iris data"),
    tableOutput("mytable")
  )
)