#An attempt to investigate the affect of common Sr additions on isochrons
library(IsoplotR)

#Constants 
Rb87Sr86_error_decimal <- 0.03
Sr87Sr86_error_decimal <- 0.03

log_changes <- function(message){
  if (!exists("model_log")){
    model_log <<- c()
  }
  model_log <<- c(model_log, message)
}
  
export_log <- function(filename = "model_log.txt", output_path = output_dir){
  filepath = paste(output_path, filename, sep='')
  if(exists("model_log")){
    fileConn = file(filepath)
    writeLines(model_log, fileConn)
    close(fileConn)
  } else {
    print("Error, no variable named 'model_log' found")
  }
}

make_rbsr_object <- function(n = 50, rb_min = 1000, rb_max = 2000, sr_min = 1, sr_max = 5, isr = 0.724){
  #Setting absolute values
  age <- 0
  Rb85 <- runif(n, rb_min, rb_max)
  Rb87 <- Rb85 * 0.38562
  Sr88 <- runif(n, sr_min, sr_max)
  Sr86 <- Sr88*0.1194
  Sr87 <- Sr86*isr
  
  #Calculating isochron ratios
  Rb87Sr86 <- Rb87/Sr86
  Sr87Sr86 <- Sr87/Sr86

  #Setting Error and Correlation
  errRb87Sr86 <- Rb87Sr86*Rb87Sr86_error_decimal #Error on the Rb87/Sr86 value
  errSr87Sr86 <- Sr87Sr86*Sr87Sr86_error_decimal#Error on the Sr87/Sr86 value
  rho <- 0 #error correlation (rho) for the isochron

  #log affect in printable string
  log_changes("New RbSr data generated, parameters are:")
  msg = paste("n = ", n, ", minimum 85Rb = ", rb_min, ", maximum 85Rb = ",
          rb_max, ", minimum 88Sr = ", sr_min, ", maximum 88Sr = ",
          sr_max, ", 87Sr/86Sr ratio = ", isr, sep = '')
  print(msg)
  log_changes(msg)
  log_changes("-----")
  
  #making global variables to be used in isochron titles
  model_age <<- 0
  max_sr <<- sr_max
  min_sr <<- sr_min
  initial_sr <<- isr
  isochron_counter <<- 1
  
  #Filling and returning a dataframe
  data.frame(age, isr, Rb85, Rb87, Sr88, Sr87, Sr86, Rb87Sr86, errRb87Sr86, Sr87Sr86, errSr87Sr86, rho)
}

to_isochron <- function(rbsr_object){
  #extracting isochron columns into a matrix
  columns = c("Rb87Sr86", "errRb87Sr86", "Sr87Sr86", "errSr87Sr86", "rho")
  temp = rbsr_object[ , columns, drop = FALSE]
  temp = as.matrix(temp)
  
  #Changing the matrix into an RbSr object
  temp = as.RbSr(temp, 1, 2)
  
  #Adding changes to the log
  msg = paste("Printed isochron m", model_number, "_", isochron_counter, sep = '')
  log_changes(msg)
  log_changes("-----")
    
  #Making the isochron
  isochron(temp)
  
  #Advancing the submodel number
  isochron_counter <<- isochron_counter + 1
}

wait <- function(rbsr_object, time){
  ### Should add some kind of exception raising if the wrong columns are there 
  #Copying the rbsr object
  temp = data.frame(rbsr_object)
  
  #calculating new 87 isotopes give the dictated passage of time (in million years)
  Sr87 = temp$Sr87 + temp$Rb87*(exp(0.000000000013972*(time*1000000))-1)
  Rb87 = temp$Rb87*exp(-0.000000000013972*(time*1000000))
  
  #Calculating new isochron ratios based on the adjusted 87 isotopes 
  Rb87Sr86 = Rb87/temp$Sr86
  Sr87Sr86 = Sr87/temp$Sr86
  errRb87Sr86 <- Rb87Sr86*Rb87Sr86_error_decimal #Error on the Rb87/Sr86 value
  errSr87Sr86 <- Sr87Sr86*Sr87Sr86_error_decimal #Error on the Sr87/Sr86 value
  
  #Copying the columns over from temp (could be fixed if there is a memory issue)
  age = temp$age
  isr = temp$isr
  Rb85 = temp$Rb85
  Sr88 = temp$Sr88
  Sr86 = temp$Sr86
  rho = temp$rho

  #Adding changes to the log
  msg = paste("Data aged by ", time, " million years", sep = '')
  log_changes(msg)
  log_changes("-----")
  
  #changing the global variable
  model_age <<- model_age + time
  
  #Filling a new dataframe tor the output
  data.frame(age, isr, Rb85, Rb87, Sr88, Sr87, Sr86, Rb87Sr86, errRb87Sr86, Sr87Sr86, errSr87Sr86, rho)
}

add_sr <- function(rbsr_object, Sr, ratio_8786 = 0.724){# not using isr to manage mutability issues with the rbsr_object
  #Add some exceptions to only accept rbsr_objects and numbers above 0 for Sr
  #Copying the rbsr object
  temp = data.frame(rbsr_object)
  
  #Adding new Sr, and calcualting expected isotope distributions
  Sr88 = temp$Sr88 + Sr
  Sr86_new = Sr*0.1194 #Sr86 added during this event
  Sr86 = temp$Sr86 + Sr86_new
  Sr87_new = Sr86_new*ratio_8786
  Sr87 = temp$Sr87 + Sr87_new

  #Recaulculating isochron ratios and "error" for those ratios
  Rb87Sr86 <- temp$Rb87/Sr86
  Sr87Sr86 <- Sr87/Sr86
  errRb87Sr86 <- Rb87Sr86*Rb87Sr86_error_decimal #Error on the Rb87/Sr86 value
  errSr87Sr86 <- Sr87Sr86*Sr87Sr86_error_decimal #Error on the Sr87/Sr86 value
    
  #Copying the columns over from temp (could be fixed if there is a memory issue)
  age = temp$age
  isr = temp$isr
  Rb85 = temp$Rb85
  Rb87 = temp$Rb87
  rho = temp$rho
  
  #Adding changes to the log
  msg = paste("Bulk addition of Sr standardized to ", Sr, " ppm 88 Sr and an 87Sr/86Sr ratio of ", ratio_8786, sep = '')
  log_changes(msg)
  log_changes("-----")
  
  #Changing global variables
  max_sr <<- max_sr + Sr
  min_sr <<- min_sr + Sr

  #Filling a new dataframe tor the output
  data.frame(age, isr, Rb85, Rb87, Sr88, Sr87, Sr86, Rb87Sr86, errRb87Sr86, Sr87Sr86, errSr87Sr86, rho)
}

isochron_title <- function(model_num = model_number, submodel_num = isochron_counter, age = model_age, initial_Sr = initial_sr, sr88_max = max_sr, sr88_min = min_sr){
  line_1 = paste("m", model_num, "_", submodel_num, sep = '')
  line_2 = paste("Age = ", age, sep = '')
  line_3 = paste("Sr88 = ", sr88_min, "-", sr88_max, " ppm", sep = '')
  # line_4 = paste("Initial Sr ratio is ", initial_Sr, sep = '')
  # title <- c(line_1, line_2, line_3, line_4)
  title <- c(line_1, line_2, line_3)
}
  
png_name <- function(model_num = model_number, submodel_num = isochron_counter, output_path = output_dir){
  name = paste(output_path, "m", model_num,"_", submodel_num,".png", sep = '')
}