# Script for generating model 1 isochrons and data

#Importing the 
library(IsoplotR)
source("Code/isochron_exploration.R")

#constants
model_number = 1

#creating a log to record the functions used in this model
model_log <- c()

#Defining an output directory
output_dir = paste("Output/model_", model_number, "/", sep='')

#Creating the RbSr object
m1 <- make_rbsr_object()
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m1)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 10 ppm Sr
m2 <- add_sr(m1, Sr = 10)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m2)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 100 ppm Sr
m3 <- add_sr(m2, Sr=100)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m3)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

export_log()