
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
# GRAPH 3
# Numerical vs Date Time Bivariate 
##################################

# Plot "Sub_metering" & Date Time

# Variable:
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
# Date + Time

df3 <- 
  dfMaster %>%
  mutate(date_time = as.POSIXct(paste(Date, Time))) %>%
  select(Sub_metering_1, Sub_metering_2, Sub_metering_3, date_time) 
 
str(df3)
summary(df3)

# This time I didn't copy to the PNG file because the legenda labels were cut
png(filename="plot3.png", width=480, height=480)

with(df3, {
  plot(date_time, Sub_metering_1
       , type = "l"
       , xlab = ""
       , ylab = "Energy sub metering")
  lines(date_time, Sub_metering_2 , type = "l", col = "red")
  lines(date_time, Sub_metering_3 , type = "l", col = "blue")
})

legend("topright"
       , col=c("black", "red", "blue")
       , lty=1
       , legend=names(df3[1:3]))

dev.off()






