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

png("plot4.png",480,480)

par(bg="transparent")

par(mfrow=c(2,2))
        with(data1,plot(time,Global_active_power,type="l",
                        xlab="",ylab="Global Active Power"))
        
        with(data1,plot(time,Voltage,type="l",
                        xlab="datetime",ylab="Voltage"))
        
        with(data1,plot(time,Sub_metering_1,type="l",
                        xlab="",ylab="Energy sub metering"))
                with(data1,points(time,Sub_metering_2,type="l",col="red"))
                with(data1,points(time,Sub_metering_3,type="l",col="blue"))
                legend("topright",lty=1,col=c("black","red","blue"),
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                       ,cex=0.9, bty = "n")
        
        with(data1,plot(time,Global_reactive_power,type="l",
                        xlab="datetime",ylab="Global_reactive_power"))
dev.off()