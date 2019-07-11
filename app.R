#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




MY_COLOURS = viridis::viridis(144)


library(shiny)
library(tidyverse)
library(leaflet)
library(RColorBrewer)


data = read.csv("data/rankings2.csv") %>%
  arrange(desc(score)) %>%
  mutate(Label = 
           paste(
             "<p><b>",
             institution,
             "</b></p>",
             "<p>", 
             round(score),
             "</p>"
           ),
         Color = MY_COLOURS[1:n()],
         Size = score) 





# ui <- fluidPage(
#     leafletOutput("mymap",height = 768)
# )
# 
# server <- function(input, output, session) {
#     
#     output$mymap <- renderLeaflet({
#       datum = 
leaflet() %>%
  addTiles(
    urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png"
  ) %>% 
  addCircleMarkers(~lng,~lat,popup = ~ Label, data=data,color = ~Color)
#     })
# }
# 
# 
# shinyApp(ui, server)

