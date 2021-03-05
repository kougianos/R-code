library(sf)
library(mapview)
library(gdtools)
options(stringsAsFactors = FALSE)
ap = "Lelystad Airport"
cd = "LEY"
class(cd)

lat = 52.460278
lon = 5.527222
class(lon)

airport = data.frame(ap, cd, lat, lon, stringsAsFactors = FALSE)


NL_Airports = read.csv(file = 'http://www.twiav.nl/files/NL_Airports.csv')

names(airport) = names(NL_Airports)
NL_Airports = rbind(NL_Airports, airport)
str(NL_Airports)


NL_Airports = st_as_sf(NL_Airports, coords = c('longitude', 'latitude'), crs = 4326)
class(NL_Airports)
NL_Airports

plot(st_geometry(NL_Airports), main = "Airports in the Netherlands", pch = 17)

st_write(NL_Airports, "NL_Airports.geojson", append = FALSE)

mapview(NL_Airports, color = "red", col.regions = "orange", alpha.regions = 1, label =NL_Airports$airport)

GR_Airports = read.csv(file = "C:\\Users\\kougi\\Downloads\\gr-airports.csv")
GR_Airports = GR_Airports[-1,]
GR_Airports_sm = GR_Airports[, c("name","iata_code", "longitude_deg","latitude_deg")]

names(GR_Airports_sm)[names(GR_Airports_sm) == 'longitude_deg'] <- 'longitude'
names(GR_Airports_sm)[names(GR_Airports_sm) == 'latitude_deg'] <- 'latitude'
str(GR_Airports_sm)

GR_Airports_sm = st_as_sf(GR_Airports_sm, coords = c('longitude', 'latitude'), crs = 4326)
GR_Airports_sm


mapview(GR_Airports_sm, color = "red", col.regions = "orange", alpha.regions = 1, label =GR_Airports_sm$name)
