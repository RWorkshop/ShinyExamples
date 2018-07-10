library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))


shinyServer(function(input, output) {
 
    formulaText <- reactive(paste("mpg ~", input$variable))
  

    output$mpgPlot1 <- renderPlot({
    boxplot(as.formula(formulaText()), data = mpgData,col=c(
"turquoise","sienna2","lavender"),horizontal=TRUE,font.axis=2)
   
  })



})