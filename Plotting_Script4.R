setwd('c://users/dale/my documents/github/exdata_plotting1')
electric1<-read.csv("household_power_consumption.txt",na.strings="?",sep=";",as.is=TRUE)
electric1[,1]<-as.Date(electric1[,1],format="%d/%m/%Y")
electric2<-subset(electric1,electric1$Date==c("2007-02-01","2007-02-02"))
rm(electric1)
electric2[,10]<-paste(as.character(electric2[,1]),electric2[,2])
electric2[,10]<- as.POSIXct(electric2[,10])
colnames(electric2)[10]<-"DateTime"
png("plot4.png", height=480, width=480)
par(mfcol=c(2,2))
plot(electric2$DateTime,electric2$Global_active_power,type='l', ylab="Global Active Power",xlab="", sub="")
lines(electric2$DateTime,electric2$Global_active_power)
plot(electric2$DateTime,electric2$Sub_metering_1,type='l', ylab="Energy sub metering",xlab="",sub="")
lines(electric2$DateTime,electric2$Sub_metering_2,col="red")
lines(electric2$DateTime,electric2$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(electric2$DateTime,electric2$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(electric2$DateTime,electric2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reative_power")
dev.off()