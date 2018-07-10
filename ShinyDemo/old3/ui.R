library(shiny) 

shinyUI(pageWithSidebar( 

headerPanel("Minimal example 2"), 

sidebarPanel( 

   textInput(inputId = "NewVal", 
          label = "Enter Value", 
          value = "1" 
            )
          ),
mainPanel(
   h3("These are your outputs"), 
   textOutput("textDisplay") 
   )

))
