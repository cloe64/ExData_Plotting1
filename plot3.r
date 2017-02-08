
###Get the data#####
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
test$Date<-as.Date(as.character(test$Date),format="%d/%m/%Y")
###Subset the data##
subtest<-subset(test,Date>="2007-02-01" & Date<="2007-02-02")
subtest$Datetime<-paste(subtest$Date,subtest$Time)
subtest$Datetime<-as.POSIXct(subtest$Datetime)
#Plot2
plot(subtest$Sub_metering_1~subtest$Datetime,ylab="Global Active Power (kilowatts)",type="l",xlab="")
lines(subtest$Sub_metering_2~subtest$Datetime,col='Red')
lines(subtest$Sub_metering_3~subtest$Datetime,col='Blue')
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
