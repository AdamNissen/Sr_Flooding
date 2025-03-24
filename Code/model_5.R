# Script for generating model 2 isochrons and data

#Importing the 
library(IsoplotR)
source("Code/isochron_exploration.R")

#constants
model_number = 5

#creating a log to record the functions used in this model
model_log <- c()

#Defining an output directory
output_dir = paste("Output/model_", model_number, "/", sep='')
#Creating the RbSr object
m1 <- make_rbsr_object(rb_min = 2000, rb_max = 2000, sr_max = 100, isr = 0.700)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m1)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#aged data 1000 ma
m2 <- wait(m1, time = 70)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m2)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 50 ppm Sr at isr 0.9
m3 <- add_sr(m2, Sr=50, ratio_8786 = 0.9)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m3)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#Adding 20ppm 88Sr
m4 <- wait(m3, time = 320)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m4)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

#waiting 500 million years
m5 <- add_sr(m4, Sr = 50, ratio_8786 = 0.9)
png(png_name(), width = 600, height = 600)
i_title = isochron_title()
to_isochron(m5)
title(i_title, adj = 0, cex.main = 0.8)
dev.off()

export_log()