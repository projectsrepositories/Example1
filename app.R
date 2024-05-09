install.packages("shiny")
library(shiny)
library(shinythemes)
library(shinyWidgets)

# Define UI for app
ui<- fluidPage(theme = shinytheme("united"),
               setBackgroundColor(
                 color = c("#FFEEDD", "#FFFFFF")
               ),

      # Navigation bar with two tabs.       
      navbarPage("Ozone level", collapsible = TRUE,
                 
          # Tab for Home page.
          tabPanel("Home",
                  
              # Sidebar layout for inputs and  outputs
              sidebarLayout(
                
                  # Inputs: Sidebar panel for inputs
                  sidebarPanel(
                      # Input1: Slider input for the number of bins
                      sliderInput(inputId = "bins",
                                  label = "Number of bins:",
                                  min = 1,
                                  max = 50,
                                  value = 30,
                                  step = 2)
                  ),

                  # Outputs: Main panel for outputs
                  mainPanel(
                        # Output1: Histogram plot
                        plotOutput(outputId = "distPlot")
                  )
              ) #sidebarLayout() is closed.
          ), 
          
          # Tab for displaying the about.md page
          tabPanel("About", 
                   div(includeMarkdown("about.md"), 
                       align="justify")
          )
      ) #navbarPage() is closed.
)

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

# Create Shiny app
shinyApp(ui = ui, server = server)

