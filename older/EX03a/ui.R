library(shiny) 

shinyUI(pageWithSidebar( 

headerPanel("Minimal example 2"), 

sidebarPanel( 

   textInput(inputId = "NewVal", 
          label = "Enter Value", 
          value = "" 
            )
          ),
mainPanel(
   h3("This is your value"), 
   textOutput("textDisplay") 
   )

))
