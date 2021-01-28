library(raster)
library(sf)
library(dplyr)
library(mapview)
library(bcmaps)
library(rayshader)
library(rmapshaper)
library(bcdata)


fires_2017 <- bcdc_query_geodata('fire-perimeters-historical') %>%
  filter(FIRE_YEAR == 2017) %>%
  collect()

big_fires <- fires_2017 %>%
  filter(FIRE_NUMBER %in% c('C50647'))

big_fires_simplify <- ms_simplify(big_fires)


elevation_raw <- cded_raster(aoi = st_bbox(big_fires) %>% st_as_sfc())

elmat <- raster_to_matrix(elevation_raw)

rs <- ray_shade(elmat, zscale = 3)
as <- ambient_shade(elmat)

elmat_water <- elmat
elmat_water[elmat_water < 0] <- 0
elmat_water[is.na(elmat_water)] <- 0

elmat %>%
  sphere_shade() %>%
  add_water(detect_water(elmat_water)) %>%
  add_shadow(rs, 0.5) %>%
  add_shadow(as, 0) %>%
  plot_3d(elmat, zscale = 10, fov = 0, theta = 260, zoom = 0.115, phi = 10, windowsize = c(800, 450))

render_depth(focus = 0.4, focallength = 100, clear = TRUE)

