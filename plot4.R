library(tidyverse)
library(lubridate)

# load data

dat <- read_delim("./data/household_power_consumption.txt", delim = ";", na = "?")

dat <- dat %>% 
  mutate(Date = dmy(Date)) %>% 
  filter((year(Date) == 2007 & month(Date) == 02) & (day(Date) == 01 | day(Date) == 02))

dat <- dat %>% 
  mutate(Time = hms(Time))

# make plot

png(filename = "Plot4.png",
    width = 480, height = 480)

par(mfcol = c(2,2), oma = c(1,1,1,1))

#first plot
with(dat, plot(Time, Global_active_power, type = "l", xlab = "",
               ylab = "Global Active Power (kilowatts)", xaxt = "n"))

axis(side = 1, at = c(0, 45000, 85000), labels = c("Thu", "Fri", "Sat"))

#second plot

with(dat, plot(Time, Sub_metering_1, type = "l", xlab = "", 
               ylab = "Energy sub metering", xaxt = "n"))

with(dat, lines(Time, Sub_metering_2, col = "red"))

with(dat, lines(Time, Sub_metering_3, col = "blue"))

axis(side = 1, at = c(0, 45000, 85000), labels = c("Thu", "Fri", "Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"), cex = 0.5, pt.cex = 1)

#third plot

with(dat, plot(Time, Voltage, type = "l", xlab = "", ylab = "Voltage", xaxt = "n"))

axis(side = 1, at = c(0, 45000, 85000), labels = c("Thu", "Fri", "Sat"))

#fourth plot

with(dat, plot(Time, Global_reactive_power, type = "l", xlab = "",
               ylab = "Global reactive Power (kilowatts)", xaxt = "n"))

axis(side = 1, at = c(0, 45000, 85000), labels = c("Thu", "Fri", "Sat"))

dev.off()
