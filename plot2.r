##Data Exploration

library(readr)
household_power_consumption <- read_delim("C:/Users/advisori/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt", 
    ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
        Time = col_time(format = "%H:%M:%S")), 
    trim_ws = TRUE)
sub_power<-household_power_consumption[household_power_consumption$Date>="2007/02/01" & household_power_consumption$Date<="2007/02/02",]
sub_power$Datetime<-paste(sub_power$Date,sub_power$Time)
sub_power$Datetime<-strptime(sub_power$Datetime, "%Y-%m-%d %H:%M:%S")
#plot2
png('plot2.png')
plot(y = sub_power$Global_active_power,x=sub_power$Datetime , main = "Global Active Power",type="l", xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
