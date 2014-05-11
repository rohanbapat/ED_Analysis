data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880)
colnames(data1)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering")
for (i in 1:nrow(data1)){
  data1$abs_time[i]<-paste(data1$Date[i],data1$Time[i])
}
data1$new_time<-strptime(data1$abs_time,"%d/%m/%Y %H:%M:%S")
  
plot(data1$new_time,data1$Global_active_power,type='l',main="",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png")
dev.off()