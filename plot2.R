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

png(filename = "Plot2.png",
    width = 480, height = 480)

with(dat, plot(Time, Global_active_power, type = "l", xlab = "",
               ylab = "Global Active Power (kilowatts)", xaxt = "n"))

axis(side = 1, at = c(0, 45000, 85000), labels = c("Thu", "Fri", "Sat"))

dev.off()