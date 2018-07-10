library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("EX01a - Modification of EX01"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("obs", 
                "Number of observations:", 
                min = 1,
                max = 2000, 
                value = 1000),
    sliderInput("rate", 
                "Rate Parameter:", 
                min = 0.001,
                max = 1, 
                value = 0.5)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))