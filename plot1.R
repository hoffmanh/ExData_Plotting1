library(tidyverse)
library(lubridate)

# load data

dat <- read_delim("./data/household_power_consumption.txt", delim = ";", na = "?")

dat <- dat %>% 
  mutate(Date = dmy(Date)) %>% 
  filter((year(Date) == 2007 & month(Date) == 02) & (day(Date) == 01 | day(Date) == 02))

# make plot

png(filename = "Plot1.png",
    width = 480, height = 480)

with(dat, hist(Global_active_power, col = "red", 
               xlab = "Global Active Power (kilowatts)",
               main = "Global Active Power"))

dev.off()

