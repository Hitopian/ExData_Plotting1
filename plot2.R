
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
# GRAPH 2
# Numerical vs Date Time Bivariate 
##################################

# Plot "Global Active Power" & Date Time

# Variable:
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Date + Time

df2 <- 
  dfMaster %>%
  mutate(date_time = as.POSIXct(paste(Date, Time))) %>%
  select(Global_active_power, date_time) %>%
  mutate(Global_active_power = as.numeric(Global_active_power))

str(df2)
summary(df2)

with(df2, plot(date_time
               , Global_active_power
               , type = "l"  # line
               , xlab = ""
               , ylab = "Global Active Power (kilowatts)"))


# PNG file
dev.copy(png
         , file = "plot2.png"
         , width = 480
         , height = 480)
dev.off()


