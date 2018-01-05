##Data Exploration

library(readr)
household_power_consumption <- read_delim("C:/Users/advisori/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", 
    ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
        Time = col_time(format = "%H:%M:%S")), 
    trim_ws = TRUE)
sub_power<-household_power_consumption[household_power_consumption$Date>="2007/02/01" & household_power_consumption$Date<="2007/02/02",]
sub_power$Datetime<-paste(sub_power$Date,sub_power$Time)
sub_power$Datetime<-strptime(sub_power$Datetime, "%Y-%m-%d %H:%M:%S")
#plot4
png('plot4.png')
par(mfrow=c(2,2))
plot(y = sub_power$Global_active_power,x=sub_power$Datetime , main = "Global Active Power",type="l", xlab = "",ylab = "Global Active Power")

plot(y = sub_power$Voltage,x=sub_power$Datetime , main = "Global Active Power",type="l", xlab = "datetime",ylab = "Voltage")

plot(y = sub_power$Sub_metering_1,x=sub_power$Datetime , type="l", xlab = "",ylab = "Energy sub metering")
lines(y = sub_power$Sub_metering_2,x=sub_power$Datetime ,type="l",col="red", xlab = "",ylab = "Global Active Power (kilowatts)")
lines(y = sub_power$Sub_metering_3,x=sub_power$Datetime ,type="l",col="blue", xlab = "",ylab = "Global Active Power (kilowatts)")
legend("topright", legend=c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"),col=c("black","red", "blue"),lty = 1:2, cex=0.8,box.lwd = 3)

plot(y = sub_power$Global_reactive_power,x=sub_power$Datetime , main = "Global Active Power",type="l", xlab = "datetime",ylab="Global_reactive_power")
dev.off()
