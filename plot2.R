datos3<-read.csv("household_power_consumption.txt", na.strings=c("NA", "-", "?"))
library(dplyr)
datos3$Date <- as.Date(datos3$Date,"%d/%m/%Y")
datosplot <- filter(datos3, Date == "2007-02-01" | Date == "2007-02-02")
datosplot$DateTime <- paste(datosplot$Date, datosplot$Time)
datosplot$DateTime <- strptime(datosplot$DateTime, format = "%Y-%m-%d %H:%M:%S")
png(file = "plot2.png")
plot(x=datosplot$DateTime, y=datosplot$Global_active_power, type="n", ylab = "Global Active Power(kilowatts)", xlab = "")
lines(x=datosplot$DateTime, y=datosplot$Global_active_power, type="l")
dev.off()