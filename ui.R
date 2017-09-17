

library(shiny)
library(leaflet)


shinyUI(fluidPage(
  
  titlePanel(""),
  
  sidebarLayout(
    sidebarPanel(
      h1(" Move the slider"),
      sliderInput("Trips", "Trips",min = 1, max = 100,value = 1,step = 1),
      checkboxInput("showtrips","Show/Hide Trip Informations ",value = T),
      h5("Note: This application can show up to 100 trips you need to move the slider from 1 to 100 and the map will draw a line between the pickup and drop-off location.")
    ),
    
    
    # Show a map and trip informations
    mainPanel(
     h3("Yellow Cab Pick-up and Drop-off Locations in NYC"),
     leafletOutput ("plot1"),
     h3("Trip Informations"),
     textOutput("fair"),
     textOutput("time")
    
    )
  )
))
