#### Part 1 Load R packages and Prepare Data #####
library(shiny)
library(ggplot2)

dataset <- diamonds

#### Part 2 User Interface ####

ui <- pageWithSidebar(
  
  headerPanel("Diamonds Explorer"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=500, round=0),
    
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('Color','Color', c('None', names(dataset))),
    
    checkboxInput('jitter', 'Jitter'),   #Check how these work?
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)

#### Part 3 Server ####
server <- function(input, output) {

  # Part 3A Preprocess the data set
  #    Uses the "sample()" function 
  
  dataset <- reactive({
    diamonds[sample(nrow(diamonds), input$sampleSize),]
  })

  
  # Part 3B : output plot
  output$plot <- renderPlot({
    
    # Create the fundamental ggplot scatterplot object
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    # Point Colout Option
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    # Sets up facetting
    facets <- paste(input$facet_row, '~', input$facet_col)
    if (facets != '. ~ .')
      p <- p + facet_grid(facets)
    
    # Jitter 
    if (input$jitter)
      p <- p + geom_jitter()
    
    # Smoothing
    if (input$smooth)
      p <- p + geom_smooth()
    
    # Print out the object
    print(p)
    
  }, height=700)
  
}

#### Part 4 : Run Application ####
runApp(list(ui=ui,server=server))