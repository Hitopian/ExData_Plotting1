
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


#######################
# GRAPH 1
# Numerical Monovariate
#######################

# Histogram "Global Active Power"

# Variable:
# Global_active_power: household global minute-averaged active power (in kilowatt)

df1 <- 
  dfMaster %>%
  select(Global_active_power) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

summary(df1$Global_active_power)

hist(df1$Global_active_power
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency"
     , col = "red")

# PNG file
dev.copy(png
         , file = "plot1.png"
         , width = 480
         , height = 480)
dev.off()


