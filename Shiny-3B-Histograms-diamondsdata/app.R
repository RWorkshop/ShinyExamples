library(shiny)
library(ggplot2)


#########################################################

ui <- bootstrapPage(	
  selectInput(inputId = "n_breaks",
              label = "Number of bins in 
              histogram (approximate):",
              choices = c(10, 20, 30,40,50,60,70, 80,90,100),
              selected = 50),
  
  plotOutput(outputId =
               "main_plot", height = "350px")
)

#########################################################

server <- function(input, output) {
  output$main_plot <- reactivePlot(
    function(){
      data(diamonds)
      hist( sqrt(diamonds$carat),
           probability = TRUE,
           breaks = as.numeric(input$n_breaks),
           col = c("darkseagreen1","darkseagreen3"),
           xlab = "Square Root of Carat Value",
           main = "Diamonds Data Set (ggplot Package)")
    })
}

##########################################################

shinyApp(ui = ui, server = server)



# http://trestletechnology.net/wp-content/uploads/2013/02/shiny_introduction.pdf
