# Script for generating model 2 isochrons and data

#Importing the 
library(IsoplotR)
source("Code/isochron_exploration.R")

#constants
model_number = 3

#creating a log to record the functions used in this model
model_log <- c()

#Defining an output directory
output_dir = paste("Output/model_", model_number, "/", sep='')

#Creating the RbSr object
m1 <- make_rbsr_object(isr = 0.76)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m1)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#aged data 250 ma
m2 <- wait(m1, time = 250)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m2)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 5 ppm Sr at isr 0.700
m3 <- add_sr(m2, Sr=5, ratio_8786 = 0.7)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m3)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#aged data 250 ma
m4 <- wait(m3, time = 250)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m4)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 20 ppm Sr at isr 0.700
m5 <- add_sr(m4, Sr=20, ratio_8786 = 0.7)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m5)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

export_log()