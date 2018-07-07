library(shiny)
data(iris)

u.n <-  as.character(unique(iris$Species))
names(u.n) <- u.n

ui <- shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput('species','Species',choices =u.n)
    ),
    mainPanel(
      plotOutput('distPlot')  
    )
  )
))

#######################################

server <- shinyServer(function(input,output,session){
  output$distPlot <- renderPlot({
    newdata <- subset(iris, iris$Species==input$species)
    ggplot(newdata, aes(x=Sepal.Width),environment = environment()) + geom_histogram()
  })
})

shinyApp(ui=ui,server = server)