#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#

#### Part 1 : Load R packages and prepare data ####

library(shiny)

#### Part 2 : User Interface ####

# Define UI for application that draws a histogram
ui <- pageWithSidebar(
  # Application title
  titlePanel('Plotting the 1974 Motor Trend dataset using Shiny'),
  
  # Sidebar with 2 select inputs and a numeric input
  sidebarPanel(
    selectInput('xCol', 'X', names(mtcars)),
    selectInput('yCol', 'Y', names(mtcars))),
  
  # Shows the plot
  mainPanel(plotOutput('plot'))
)

  # Input List: XCol and yCol

#### Part 3 : Server ####

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  # Get the data from the variables declared on the ui.R file
  df <- reactive({mtcars[, c(input$xCol, input$yCol)]})
  
  # Create the plot
  output$plot <- renderPlot({plot(df(), pch = 20, cex = 3, col = "blue",
                                  main = "1974 Motor Trend dataset")})
}

 # Output List : plot

#### Part 4 ;  Run the application ####
shinyApp(ui = ui, server = server)

