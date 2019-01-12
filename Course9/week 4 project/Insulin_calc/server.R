#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      
      calc1 <- reactive({
            carbohydrate <- input$sliderCarb
            cu <- input$cu
            fac <- input$fac
            insulin <- floor(carbohydrate / cu * fac)
            paste("You have to inject ", insulin, " insulin units.")
      })
      
      calc2 <- reactive({
            per100 <- input$sliderCarbPer100
            food <- input$sliderFood
            cu <- input$cu
            fac <- input$fac
            
            carbohydrate <- food * per100 / 100
            insulin <- floor(carbohydrate / cu * fac)
            paste("You have to inject ", insulin, " insulin units.")
      })
      
      output$calc1 <- renderText({ calc1() }) 
      output$calc2 <- renderText({ calc2() }) 
})
