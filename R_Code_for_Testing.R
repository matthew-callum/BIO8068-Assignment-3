library(leaflet)
library(leafem)
library(mapview)
library(slickR)

Heddon_map <- leaflet()%>%
  addTiles() %>%
  addMarkers(lng = -1.790520, lat = 54.992910, popup = "Heddon-on-the-Wall inside rural Northumberland")


Heddon_Map <-leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  addProviderTiles(providers$Stamen.TonerLines,
                   options = providerTileOptions(opacity = 0.5)) %>%
  addProviderTiles(providers$Stamen.TonerLabels) %>% 
  addMarkers(lng=-1.790520, lat=54.992910, popup="Heddon-on-the-Wall inside rural Northumberland")%>%
  addMarkers(lng = -1.6178, lat = 54.9783, popup = "Newcastle Upon Tyne located 10 miles away from Heddon")%>%
  addCircleMarkers(lng=-1.790520, lat=54.992910, popup="Heddon-on-the-Wall", radius = 30, color = "Blue")

HWall <- base64enc::dataURI(file="www/Hadrians Wall.jpg", mime = "image/jpg")
HChurch <- base64enc::dataURI(file = "www/Heddon-St Andrews Church of England.jpg", mime = "image/jpg")
HVillage <- base64enc::dataURI(file = "www/Heddon-Village.jpg", mime = "image/jpg")

img(src=Hwall)

slides <- list.files("WWW", pattern = ".jpg", full.names = TRUE)

slickROutput("slickr", width="500px")

output$slickr <- renderSlickR({
  slickR(imgs)
})

