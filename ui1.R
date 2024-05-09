
library(shiny)
library(shinythemes)



# Define UI for app
ui<- fluidPage(theme = shinytheme("united"),
               setBackgroundColor(
                 color = c("#FFEEDD", "#FFFFFF")
               ),

      # App title ----
      #titlePanel("Ozone level"),
       
      # Navigation bar with two tabs.       
      navbarPage("Ozone level", collapsible = TRUE,
                 
          # Tab for Home page.
          tabPanel("Home",
                  
              # Sidebar layout 
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

