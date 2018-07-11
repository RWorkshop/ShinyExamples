

library(shiny)
####################################
ui <- fluidPage(
  titlePanel("Shiny Application"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var",label="Choose a variable",choice=c("Sepal.Length"=1,
                                                           "Sepal.Width"=2,
                                                           "Petal.Length"=3,
                                                           "Petal.Width"=4), 
                  selectize=FALSE)),
    
    mainPanel(
      h2("Summary of the variable"),
      verbatimTextOutput("sum"),
      plotOutput("box")
    )
  ))

####################################

server <- function(input,output){
  
  output$sum <- renderPrint({
    
    summary(iris[,as.numeric(input$var)])
  })
  
  output$box <- renderPlot({
    
    x<-summary(iris[,as.numeric(input$var)])
    boxplot(x,col="sky blue",border="purple",main=names(iris[as.numeric(input$var)]),horizontal=TRUE)
  })
}
####################################

# Run the application 
shinyApp(ui = ui, server = server)

