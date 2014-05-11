setwd ("C:/Users/lrich_000/Documents/R/R Working Directory/Plotting Data/exdata_data_household_power_consumption/")

## read data
d <- read.table("household_power_consumption.txt", 
      skip = 66637, nrow = 2880, sep=";",
      na.strings="?",
      header=TRUE
)

wDays <- strptime(paste(d[,1], d[,2]), format='%d/%m/%Y %H:%M:%S')


## convert power measurements to numeric
for(i in 3:9){
  d[, i] <- as.numeric(d[, i])
}



png(filename="C:/Users/lrich_000/Desktop/Data Science/Git/ExData_Plotting1/plot4.png")

par(mfrow=c(2,2))

## Plots top left
plot(wDays, d[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")


## Plots top Right
plot(wDays, d[,5], type="l", xlab="", ylab="Voltage")

#Plots Bottomg left
plot(wDays, d[,7], type="l", xlab="", ylab="Energy sub metering")
lines(wDays, d[,8], type="l", col="red",xlab="",ylab="")
lines(wDays, d[,9], type="l", col="blue",xaxt="n",yaxt="n",xlab="",ylab="")
legend("topright",lty="solid", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), bty="y",
   col=c("black", "red", "blue"))

## Plots bottom Right
plot(wDays, d[,4], type="l", xlab="", ylab="Global_reactive_power")


dev.off()
