
library(shiny)
library(ggplot2)

data(diamonds)

########################################
# Define UI for application that draws a histogram
ui <- fluidPage(
   
# Application title
   titlePanel("Diamonds Data Set"),
   
# Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
# Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

########################################

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      ggplot(data=diamonds,aes(x=carat)) + 
         geom_histogram(bins= input$bins,fill="darkseagreen2",col="darkseagreen4") + 
         theme_bw()
      
   })
}


########################################

# Run the application 
shinyApp(ui = ui, server = server)

