library(shiny)

##################################

ui <- fluidPage(
   ## Input component 1: title
   titlePanel("Shiny Boxplot App Version 1"),
   
   ## Input Component 2: Slider with explanatory text 
   
   sidebarPanel(h5("This slider will allow you to", strong("interact"), "with the app"),
           sliderInput(inputId = "slider1",
                       label = "Choose a number",
                       value = 400, 
                       min = 150, 
                       max = 1000)
                ),
   
   ## Component 3: Graphic
   
   img(height = 30, width = 90, src = "http://www.rstudio.com/images/RStudio.2x.png"),
   
   ## Component 4: Boxplot from server component of program
   plotOutput("boxplot")
)

################################

server <- function(input, output) {
  output$boxplot <- renderPlot({
    title <- "Histogram of Random Normal Values"
    boxplot(rnorm(input$slider1), main = title,col = c("darkseagreen1","darkseagreen2","darkseagreen3"),horizontal = TRUE) 
  }) ## use curly brackets to spread code over multiple lines
}

###############################

shinyApp(ui = ui, server = server)
