#TreeVolume App: Data Products Week 4 Project

library(shiny)
shinyServer(function(input, output) {
  model <- lm(Volume ~ Girth, data = trees)

  modelpred <- reactive({
    GirthInput <- input$sliderGirth
    predict(model, newdata = data.frame(Girth = GirthInput))
  })
  output$plot <- renderPlot({
    GirthInput <- input$sliderGirth
    
    plot(trees$Girth, trees$Volume, xlab = "Girth (in)", 
         ylab = "Volume (cu ft)", bty = "n", pch = 16,
         xaxp = c(8,22,7), ylim = c(0, 80), 
         main = "Volume and Girth of Black Cherry Trees")
    abline(model, col = "purple", lwd = 2)
    points(GirthInput, modelpred(), col = "green", pch = 16, cex = 2)
      
  })
  
  output$pred <- renderText({
    modelpred()
  })
  
 })