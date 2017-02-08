
###Get the data#####
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
test$Date<-as.Date(as.character(test$Date),format="%d/%m/%Y")
head(test,5)
###Subset the data##
subtest<-subset(test,Date>="2007-02-01" & Date<="2007-02-02")
subtest$Datetime<-paste(subtest$Date,subtest$Time)
subtest$Datetime<-as.POSIXct(subtest$Datetime)
#Plot2
par(mfrow=c(2,2))
with(subtest,
     {plot(as.numeric(Global_active_power)~Datetime,ylab="Global Active Power (kilowatts)",type="l",xlab="")
      plot(Voltage~Datetime,xlab="datetime",ylab="Voltage",type="l")
      plot(Sub_metering_1~Datetime,ylab="Energy sub metering)",type="l",xlab="")
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
      legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,bty="n")
      plot(Global_reactive_power~Datetime,ylab="Global_Reactive_power",type="l",xlab="datetime")
})
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
