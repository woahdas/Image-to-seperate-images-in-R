library(raster)
dem <- raster(nrow=256, ncol=256, vals=1:(256*256))

agg <- aggregate(raster(dem), fact=c(1,1)) #splits image into individual pixel by pixel images
agg_poly <- rasterToPolygons(agg)
r_list <- list()
for(i in 1:ncell(agg)){
  img <- r_list[[i]] <- crop(dem, agg_poly[i,])
  show(img)
  n <- 0
  for(n != 65536){
  bmp(file="saved " + n + ".bmp", width = 1, height = 1)
  n++
  }
