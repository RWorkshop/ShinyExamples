
library(shiny)
library(shinythemes)


fig.width <- 600
fig.height <- 450

#### Part 2: User Interface ####

ui <- fluidPage(theme =  shinytheme("cerulean"),
                  titlePanel("Linear Regression Model"),
                  #list(tags$head(tags$style("body {background-color: gray; }"))),
                  sidebarLayout(
                    sidebarPanel(
                      
                      # sidepbar panel has the Input
                      h4("Note that"),
                      h4("* The input data set should contain",
                         "predictor in fisrt column and outcome in second column",style = "font-family: 'times'; font-si16pt"),
                      helpText("* the type of file you upload should be .asv or .txt",style = "font-family: 'times'; font-si16pt"),
                      
                      br(),
                      # Check box for selection of header and type of file option
                      checkboxInput('header','Header', value = F),
                      checkboxInput('default','Default Data Set', value = T),
                      br(),
                      radioButtons('sep', 'separator', c(comma = ',', semicolon = ';', tab = '\t'), selected = NULL, inline = FALSE),
                      br(),
                      
                      # take the file from user
                      fileInput('data', 'Choose file to upload', multiple = FALSE, accept = c('.text/ comma-separated-values',
                                                                                              '.csv',
                                                                                              '.xlsx',
                                                                                              '.txt',
                                                                                              '.text/ tab-separated-values')),
                      
                      helpText("Deselect default data set when you upload your data set"),
                      
                      numericInput("obs", "Observations:", 20,
                                   min = 1, max = 100),
                      
                      
                      
                      
                      #    sliderInput("intercept",
                      #                strong("Intercept"),
                      #                min=-2, max=6, step=.5,
                      #                value=sample(seq(-2, 6, .5), 1), ticks=FALSE),
                      #    sliderInput("slope", 
                      #                strong("Slope"),
                      #                min=-1, max=3, step=.25, 
                      #                value=sample(seq(-1, 3, .25), 1), ticks=FALSE),
                      br(),
                      wellPanel(
                        h5("Contact Info:"),
                        h5("Kevin O'Brien"),
                    #    helpText(   a("View My LinkedIn Profile",href="https://www.linkedin.com/in/kunaljagtap")),
                    #    helpText("srkunaljagtap@gmail.com")
                      ),
                      br(),br(),br(),br()
                    ),
                    
                    
                    mainPanel(
                      tabsetPanel(
                        
                        tabPanel("Table", tableOutput("table")),
                        tabPanel("Plot", plotOutput("plot")),
                        tabPanel("Linear Regression", plotOutput("LinearPlot")),
                        tabPanel("Summary", verbatimTextOutput("summary")),
                        tabPanel("Linear Regression Summary", verbatimTextOutput("Linearsummary"))
                      )
                    )
                    
                  )  
)


###############################################################################

server <- function(input, output) {
  
  inputData<-reactive({
    
    inFile <- input$data
    
    if (is.null(inFile))
      return(NULL)
    
    file <- read.csv(inFile$datapath, header = input$header,
                     sep = input$sep, quote = input$quote)
    
  })
  
  output$table <- renderTable({
    inFile <- input$data
    
    if(input$default == T) 
    {
      x <- rnorm(input$obs, 0, 2)
      y <- 2 + x + rnorm(input$obs, 0, 1)
      file <- cbind(x,y)
      
    }
    else
    {
      if(is.null(input$data))  {
        return(NULL)
      } 
      file <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote)
      
      file<- file[1:input$obs,]
    }
  })
  
  
  
  output$plot <- renderPlot({
    
    inFile <- input$data
    
    if(input$default == T) 
    {
      x <- rnorm(input$obs, 0, 2)
      y <- 2 + x + rnorm(input$obs, 0, 1)
      file <- cbind(x,y)
      
    }
    else {
      if(is.null(input$data))    
        return(NULL) 
      file <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote)
      
      file<- file[1:input$obs,]
      x<- file[,1]
      y<- file[,2]
    } 
    
    
    
    a<- input$intercept
    b<-input$slope
    #    
    #    yhat <- input$intercept + x * input$slope
    regression <- lm(x~y)
    intercept1<- coef(regression)["(Intercept)"] 
    slope<- coef(regression)["y"] 
    #   
    
    plot(x, y, cex = 1, font = 3)
    points(x, y, pch = 16, cex = 0.8, col = "red",xlab = "Explanatory Variable",ylab = "Outcome Variable")
    title("Linear Regression")
    #geom_abline(intercept = intercept1, slope = slope, colour = "red", size = 2) 
    
  })
  
  
  
  output$LinearPlot <- renderPlot({
    
    inFile <- input$data
    
    
    if(input$default == T) 
    {
      x <- rnorm(input$obs, 0, 2)
      y <- 2 + x + rnorm(input$obs, 0, 1)
      file <- cbind(x,y)
      
    }
    else {
      
      if(is.null(input$data))     
        return(NULL) 
      file <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote)
      
      file<- file[1:input$obs,]
      x<- file[,1]
      y<- file[,2]
    }
    
    
    par(mfrow=c(2,2))
    plot(lm(x~y),col.axis = "blue") 
    points(x, y, pch = 16, cex = 0.8, col = "red")
  })
  
  
  
  output$summary <-renderPrint({
    inFile <- input$data
    
    
    if(input$default == T) 
    {
      x <- rnorm(input$obs, 0, 2)
      y <- 2 + x + rnorm(input$obs, 0, 1)
      file <- cbind(x,y)
      
    }
    else {
      
      
      if(is.null(input$data))     
        return()
      
      
      file <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote)
      
      file<- file[1:input$obs,]
    }
    
    
    summary(file)
    
  })
  
  
  output$Linearsummary <-renderPrint({
    inFile <- input$data
    
    
    if(input$default == T) 
    {
      x <- rnorm(input$obs, 0, 2)
      y <- 2 + x + rnorm(input$obs, 0, 1)
      file <- cbind(x,y)
      
    }
    else {
      
      if(is.null(input$data))     
        return()
      
      file <- read.csv(inFile$datapath, header = input$header,
                       sep = input$sep, quote = input$quote)
      
      file<- file[1:input$obs,]
      x<- file[,1]
      y<- file[,2]
    }
    
    
    
    summary(lm(x~y))
    
  })
  
  
  
  
  
  
  
}

#### Part 4 Run the Application ######
runApp(list(ui=ui,server=server))