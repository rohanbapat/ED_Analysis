data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880)
colnames(data1)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering_3")
for (i in 1:nrow(data1)){
  data1$abs_time[i]<-paste(data1$Date[i],data1$Time[i])
}
par(mfrow=c(1,1))
data1$new_time<-strptime(data1$abs_time,"%d/%m/%Y %H:%M:%S")
plot(data1$new_time,data1$Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
lines(data1$new_time,data1$Sub_metering_2,type='l',col="red")
lines(data1$new_time,data1$Sub_metering_3,type='l',col="blue")
legend(x=c("topright"),lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),cex=0.5)
dev.copy(png,file="plot3.png")
dev.off()
