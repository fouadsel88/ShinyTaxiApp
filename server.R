

library(shiny)

shinyServer(function(input, output) {
    library(tidyr)
    library(leaflet)
  # Uploading and processing the data 
  Taxi_raw<- read.csv("trips.csv")
  taxi2<-Taxi_raw[1:100,]
  taxi2<-taxi2[,c(1,8,7,12,11,3,20)]
  
  #rendertext fair amount
    output$fair<- renderText({
      trips <-input$Trips
      x<-paste(as.character( taxi2[trips,][[7]]), "$")
      y<-paste("Fair Amount: ",x)
      ifelse(input$showtrips,y,"")
      
   })
    
  #rendertext Pick-up Date Time
    output$time<- renderText({
      trips <-input$Trips
      x<-paste("Pick-up Date Time:  ",as.character( taxi2[trips,][[6]]))
      ifelse(input$showtrips,x,"")
      
    })
    
    #reactive for the  slider
    taxi3 <- reactive({
      trips <-input$Trips
      taxi2[1:trips,]
      
      })
    
    # leaflet Map
    output$plot1<-  renderLeaflet({
      map3 = leaflet(taxi2) %>% addTiles()
      for(i in 1:nrow(taxi3())){
        map3 <- addPolylines(map3, lat = as.numeric(taxi3()[i, c(2, 4)]), 
                             lng = as.numeric(taxi3()[i, c(3, 5)]))
      }
        map3 
      
    })
      
})
