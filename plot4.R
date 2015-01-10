datos3<-read.csv("household_power_consumption.txt", na.strings=c("NA", "-", "?"))
library(dplyr)
datos3$Date <- as.Date(datos3$Date,"%d/%m/%Y")
datosplot <- filter(datos3, Date == "2007-02-01" | Date == "2007-02-02")
datosplot$DateTime <- paste(datosplot$Date, datosplot$Time)
datos3<-read.csv("household_power_consumption.txt", na.strings=c("NA", "-", "?"))
library(dplyr)
datos3$Date <- as.Date(datos3$Date,"%d/%m/%Y")
datosplot <- filter(datos3, Date == "2007-02-01" | Date == "2007-02-02")
datosplot$DateTime <- paste(datosplot$Date, datosplot$Time)
datosplot$DateTime <- strptime(datosplot$DateTime, format = "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png") 


par(mfrow=c(2,2), mar = c(4, 4, 4, 4), oma = c(1, 1, 1, 1))
plot(x=datosplot$DateTime, y=datosplot$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(x=datosplot$DateTime, y=datosplot$Global_active_power, type="l")

plot(x=datosplot$DateTime, y=datosplot$Voltage, type="n", ylab = "Voltage", xlab = "datetime")
lines(x=datosplot$DateTime, y=datosplot$Voltage, type="l")


plot(x=datosplot$DateTime, y=datosplot$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(x=datosplot$DateTime, y=datosplot$Sub_metering_1, type="l", col=1)
lines(x=datosplot$DateTime, y=datosplot$Sub_metering_2, type="l", col="red")
lines(x=datosplot$DateTime, y=datosplot$Sub_metering_3, type="l", col="blue")
legend ("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, bty="n")

plot(x=datosplot$DateTime, y=datosplot$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab = "datetime")
lines(x=datosplot$DateTime, y=datosplot$Global_reactive_power, type="l")
dev.off()