if(!exists("data1")){
        temp<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                       nrows=10)
        classes<-sapply(temp,class)
        data<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",
                       colClasses=classes)
        
        data1<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
        
        time<-paste(data1$Date,data1$Time)
        time<-strptime(time,format="%d/%m/%Y %H:%M:%S")
        data1$Time<-time
}

png("plot3.png",480,480)

par(bg="transparent")

with(data1,plot(time,Sub_metering_1,type="l",
                xlab="",ylab="Energy sub metering"))
with(data1,points(time,Sub_metering_2,type="l",col="red"))
with(data1,points(time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,cex=1)

dev.off()