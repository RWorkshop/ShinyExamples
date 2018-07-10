library(shiny) 

shinyUI(pageWithSidebar( 

headerPanel("MTCARS Example"), 

sidebarPanel( 
            selectInput("variable", "Variable:",
            list("Cylinders" = "cyl", 
                 "Transmission" = "am", 
                  "Gears" = "gear")),
            ),
mainPanel(
   h3("Plot"), 
   plotOutput("mpgPlot1")
   )

))


