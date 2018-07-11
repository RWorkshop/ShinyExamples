library(shiny) 

shinyUI(pageWithSidebar( 

headerPanel("Minimal example 4"), 

sidebarPanel( 

   textInput(inputId = "Val1", 
          label = "Enter Value 1", 
          value = "0" 
            ),
   textInput(inputId = "Val2", 
          label = "Enter Value 2", 
          value = "0" 
            )
          ),
mainPanel(
   h3("These are the outputs"), 
   tableOutput("values") 
   )

))


