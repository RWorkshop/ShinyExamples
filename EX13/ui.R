
library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Dice Example"),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
 selectInput("Sides", "Number of Sides:",
c(4,5,6,7,8)
),
    selectInput("Iters", "Iterations:",
c(50,100,250,500,750,1000)
)
  ),

  # Show a plot of the generated distribution
  mainPanel(
  tableOutput("values") 
   )
))

