data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880)
colnames(data1)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")
for (i in 1:nrow(data1)){
  data1$abs_time[i]<-paste(data1$Date[i],data1$Time[i])
}
data1$new_time<-strptime(data1$abs_time,"%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(data1$new_time,data1$Global_active_power,type='l',ylab="Global Active Power",xlab="")
plot(data1$new_time,data1$Voltage,type='l',ylab="Voltage",xlab="datetime")
plot(data1$new_time,data1$Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
lines(data1$new_time,data1$Sub_metering_2,type='l',col="red")
lines(data1$new_time,data1$Sub_metering_3,type='l',col="blue")
legend(x=c("topright"),lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),cex=0.25)
plot(data1$new_time,data1$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")
dev.copy(png,file="plot4.png")
dev.off()