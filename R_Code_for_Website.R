#Code used to load required packages
library(shiny)
library(leaflet)
library(leafem)
library(mapview)
library(slickR)

#Code for the leaflet map of Heddon-on-the-Wall stored as a Dataframe for ease of use
Heddon_Map <-leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  addProviderTiles(providers$Stamen.TonerLines,
                   options = providerTileOptions(opacity = 0.5)) %>%
  addProviderTiles(providers$Stamen.TonerLabels) %>% 
  addMarkers(lng=-1.790520, lat=54.992910, popup="Heddon-on-the-Wall inside rural Northumberland")%>%
  addMarkers(lng = -1.6178, lat = 54.9783, popup = "Newcastle Upon Tyne located 10 miles away from Heddon")%>%
  addCircleMarkers(lng=-1.790520, lat=54.992910, popup="Heddon-on-the-Wall", radius = 30, color = "Blue")

#Code for the images to be included in the slideshow in the side panel
slides <- list.files("WWW", pattern = ".jpg",  full.names = TRUE)


#SHINY CODE BELOW THIS SECTION


ui <- fluidPage( titlePanel("Heddon-on-the-Wall"),
                 sidebarLayout(
                   sidebarPanel(h2("A slideshow of some of the highlights of Heddon-on-the-Wall"),
                                slickROutput("slickr", width ="300px"),
                                p("This slideshow shows: A section of the historic Hadrians Wall that runs through the town,
                                  St Andrews Church located within the village, and one of the many beautiful views of the village.")),
                   
                   mainPanel(
                     h1("A Historic Village"),
                     Heddon_Map,
                     p("The above map can be used to find Heddon-on-the-Wall in its position nestled within rural Northumberland, 
                    for reference we have also marked Newcastle-upon-Tyne which is located approximately 9 miles east of the village."),
                     br(),
                     
                     p("Some fun facts about Heddon-on-the Wall: Whilst the On-the-Wall section refers to the section of Hadrians Wall that runs throught the village,
                       Heddon means hill where heather grew.
                       Previously a Roman milecastle was located in the same place that Heddon currently is located, but no traces of it remain.
                       The 2001 Outbreak of Foot-and-mouth disease originated from a farm within the village."))
                   
                 ))


server <- function(input, output) {
  output$slickr <- renderSlickR({
    slickR(slides)
  })
}


shinyApp(ui = ui, server = server)