# Script for generating model 2 isochrons and data

#Importing the 
library(IsoplotR)
source("Code/isochron_exploration.R")

#constants
model_number = 7

#creating a log to record the functions used in this model
model_log <- c()

#Defining an output directory
output_dir = paste("Output/model_", model_number, "/", sep='')

#Creating the RbSr object
m1 <- make_rbsr_object(rb_min = 1000, rb_max = 2000, sr_max = 50, isr = 0.7)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m1)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#adding a bunch of radiogenic Sr
m2 <- add_sr(m1, Sr = 50, ratio_8786 = 0.9)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m2)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#waiting for 300 m.y.
m3 <- wait(m2, 300)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m3)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 20ppm 88Sr
m4 <- add_sr(m3, Sr = 50, ratio_8786 = 0.9)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m4)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#waiting 500 million years
m5 <- wait(m4, time = 300)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m5)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

export_log()