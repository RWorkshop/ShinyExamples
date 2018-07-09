#### Part 1: Load R packages ####

library(shiny)
library(gglot2)

#### Part 2: User Interface ####
ui <- pageWithSidebar(
  # Application title
  headerPanel("Hello Shiny!"),
  # Sidebar with a slider input
  sidebarPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot")),
      tabPanel("Summary", verbatimTextOutput("summary")),
      tabPanel("Table", tableOutput("table"))
    )),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
)
#### Part 3 Server ####

# outputs:
#   1. plot
#   2. summary
#   3. table

server <- function(input,output){}

#### Part 4 Run the Application ####

runApp(list(ui=ui,server=server))
