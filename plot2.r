setwd ("C:/Users/lrich_000/Documents/R/R Working Directory/Plotting Data/exdata_data_household_power_consumption/")

## read data
d <- read.table("household_power_consumption.txt", 
      skip = 66637, nrow = 2880, sep=";",
      na.strings="?",
      header=TRUE
)

head(d)

wDays <- strptime(paste(d[,1], d[,2]), format='%d/%m/%Y %H:%M:%S')


## convert power measurements to numeric
for(i in 3:9){
  d[, i] <- as.numeric(d[, i])
}

png(filename="C:/Users/lrich_000/Documents/R/R Working Directory/Plotting Data/plot2.png")
plot(wDays, d[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

