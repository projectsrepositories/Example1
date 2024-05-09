


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  output$distPlot <- renderPlot({
    
    x    <- airquality$Ozone
    x    <- na.omit(x)
    bins1 <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins1, col = "#75AADB", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}

