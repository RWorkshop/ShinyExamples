library(shiny)

###########################
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
###########################

server <- function(input,output){}
##########################

runApp(list(ui=ui,server=server))
