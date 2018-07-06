librsry(shiny)

#######################
  server = function(input, output) {
    df <- data.frame( x = rnorm(10), y = rnorm(10) )
    output$distPlot1 <- renderPlot({ plot( df, x ~ y ) })
    output$distPlot2 <- renderPlot({ plot( df, x ~ y ) })
  },
#######################
  ui = fluidPage( mainPanel(
    tabsetPanel(
      tabPanel( "Plot", plotOutput("distPlot1") ),
      tabPanel( "Plot", plotOutput("distPlot2") )
    )
  ))

########################
