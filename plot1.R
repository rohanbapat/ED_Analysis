data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,nrows=2880)
head(data1)
colnames(data1)<-c("Date","Time","Global_active_power","Global_reactive_power",
                   "Voltage","Global_intensity","Sub_metering_1",
                   "Sub_metering_2","Sub_metering")
hist(data1$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.copy(png,file="plot1.png")
dev.off()
