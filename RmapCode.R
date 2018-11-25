library(maptools)
library(RColorBrewer)
library(classInt)
library(OpenStreetMap)
library(sp)
library(rgeos)
library(tmap)
library(tmaptools)
library(sf)
library(rgdal)
library(geojsonio)
library(shinyjs)

WorldMapSF <- read_shape("N:/CHA/GISS/wk4/CW/WorldProject/TM_WORLD_BORDERS-0.3/TM_WORLD_BORDERS-0.3.shp", as.sf = TRUE)
qtm(WorldMapSF)

MapData <- read.csv("N:/CHA/GISS/wk4/CW/WorldProject/cwp1/G.csv", header = TRUE, sep = ",")

WorldDataMap <- append_data(WorldMapSF,MapData, key.shp = "FIPS", key.data = "FIPS", ignore.duplicates = TRUE， ignore.na = TRUE)

tmap_mode("plot")
qtm(WorldDataMap) + 
  tm_shape(WorldDataMap) + 
  tm_polygons("Number", 
              style = ("jenks"),
              palette="OrRd",
              n = 8,
              contrast = c(0, 1),
              border.col = "white",
              title="Number of companies (2018)",
              alpha = 0.5) + 
  tm_layout(main.title  = "FORTUNE GLOBAL 500 by number and country (2018)", main.title.position = "center", main.title.size = 1, legend.outside = TRUE, legend.outside.position = c("left", "bottom"))

