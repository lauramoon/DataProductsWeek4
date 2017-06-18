#TreeVolume App: Data Products Week 4 Project

library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Tree Volume from Girth"),
  sidebarLayout(
    sidebarPanel(
      p("This app predicts the volume of timber produced
         from a tree given its girth. The prediction is based on 
         measurements of 31 black cherry trees, where the girth
         was measured at 4 feet 6 inches above the ground."),
      sliderInput("sliderGirth", "What is the girth (diameter) 
                  of the tree in inches?", 
                  9, 19, step = 0.1, value = 14)
    ),
    mainPanel(
      plotOutput("plot"),
      h4("Predicted Volume (cubic feet):"),
      textOutput("pred")
    )
  )
))