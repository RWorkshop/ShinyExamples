library(shiny)
library(ggplot2)

library(dplyr)
library(magrittr)

data("diamonds")

var.list <- c("Cut" = 2,"Colour"= 3,"Clarity" = 4)

##################################

ui <- fluidPage(
  ## Input component 1: title
  titlePanel("Shiny Boxplot App Version 2"),
  
  ## Input Component 2: Slider with explanatory text 
  
  sidebarPanel(
               selectInput('groupvar','Select a variable',choices =c("Cut" = 2,"Colour"= 3,"Clarity" = 4))
  ),
  
  ## Component 3: Boxplot from server component of program
  plotOutput("boxplot")

)

################################

server <- function(input, output) {
  

    df <- reactive( {
      return(  diamonds %>% select(carat,input$groupvar) ) 
    } ) 
  
  output$boxplot <- renderPlot({
     groupvar = input$groupvar
     ggplot(data=df(),aes(x = groupvar, y = carat )) + 
      geom_boxplot(fill="darkseagreen1") + 
      ggtitle("Boxplot") + 
      coord_flip()
  }) 


  
  
}

###############################

shinyApp(ui = ui, server = server)
