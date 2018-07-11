library(shiny)
library(ggplot2)
library(magrittr)
library(dplyr)


data(diamonds)
u.col <-  as.character(unique(diamonds$color))
names(u.col) <- u.col

ui <- shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput('chosencolour','Diamond Colour Categories',choices =u.col),
   
      # Sidebar with a slider input for number of bins 
      sliderInput("bins", "Number of bins:",min = 1,max = 50, value = 30),

      selectInput('fillcolour','Chose an output colour',choices = colours()[sample(1:600,5)])),
    
    mainPanel(      plotOutput('distPlot')     )
  )
))

#######################################

server <- shinyServer(function(input,output,session){
  output$distPlot <- renderPlot({
    newdata <- diamonds %>% filter(color==input$chosencolour)
    ggplot(newdata, aes(x=carat),environment = environment()) + geom_histogram(bins=input$bins,fill=input$fillcolour)
  })
})

#######################################

shinyApp(ui=ui,server = server)

#######################################