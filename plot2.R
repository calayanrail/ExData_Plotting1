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

png("plot2.png",480,480)

par(bg="transparent")

with(data1,plot(time,Global_active_power,type="l",
                xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()