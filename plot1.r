setwd ("C:/Users/lrich_000/Documents/R/R Working Directory/Plotting Data/exdata_data_household_power_consumption/")

## read data
d <- read.table("household_power_consumption.txt", 
      skip = 66637, nrow = 2880, sep=";",
      na.strings="?",
      header=TRUE
)
##      col.names = colnames(read.table("household_power_consumption.txt")))

## convert power measurements to numeric
for(i in 3:9){
  d[, i] <- as.numeric(d[, i])
}



png(filename="C:/Users/lrich_000/Documents/R/R Working Directory/Plotting Data/plot1.png")
histd <- hist(d[,3],main="Global Active Power", 
         xlab="Global Active Power (kilowatts)",col="red")
dev.off()
