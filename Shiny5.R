shinyUI(pageWithSidebar(
  # Application title
  titlePanel('Plotting the 1974 Motor Trend dataset using Shiny'),
  
  # Sidebar with 2 select inputs and a numeric input
  sidebarPanel(
    selectInput('xCol', 'X', names(mtcars)),
    selectInput('yCol', 'Y', names(mtcars))),
  
  # Shows the plot
  mainPanel(plotOutput('plot'))
))
###########################

shinyServer(function(input, output, session) {
  # Get the data from the variables declared on the ui.R file
  df <- reactive({mtcars[, c(input$xCol, input$yCol)]})

  # Create the plot
  output$plot <- renderPlot({plot(df(), pch = 20, cex = 3, col = "blue",
                                  main = "1974 Motor Trend dataset")})
})

############################
