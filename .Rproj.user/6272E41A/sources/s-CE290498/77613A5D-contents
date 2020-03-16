
##############################
# LOAD DATA & DATA PREPARATION
##############################

library(dplyr)

# Download data from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# and changee the working directory path
setwd("F:/DATA")

dfMaster <- read.table("household_power_consumption.txt"
                       , sep = ";"
                       , header = TRUE
                       , na.strings = "?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02
dfMaster <-
  dfMaster %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02" )


##################################
# GRAPH 4
# Numerical vs Date Time Bivariate 
##################################

# Panel of 4 graphs:
# - Graph 2
# - Graph 3
# - New graph: Voltage vs. Date & Time
# - New graph: Global_reactive_power vs. Date & Time

df4 <- 
  dfMaster %>%
  mutate(date_time = as.POSIXct(paste(Date, Time)))
 

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1))

  
with(df4, {
  plot(date_time, Global_active_power
       , type = "l"
       , xlab = ""
       , ylab = "Global Active Power")
  plot(date_time, Voltage
       , type = "l"
       , xlab = "datetime")
  plot(date_time, Sub_metering_1
       , type = "l"
       , xlab = ""
       , ylab = "Energy sub metering")
  lines(date_time, Sub_metering_2 , type = "l", col = "red")
  lines(date_time, Sub_metering_3 , type = "l", col = "blue")
  legend("topright"
       , col= c("black", "red", "blue")
       , lty= 1
       , cex = 0.5
       , bty = "n"
       , legend=names(df3[1:3]))
  plot(date_time, Global_reactive_power
       , type = "l"
       , xlab = "datetime")
})

dev.off()






