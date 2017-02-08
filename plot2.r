
###Get the data#####
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
test$Date<-as.Date(as.character(test$Date),format="%d/%m/%Y")
head(test,5)
###Subset the data##
subtest<-subset(test,Date>="2007-02-01" & Date<="2007-02-02")
subtest$Datetime<-paste(subtest$Date,subtest$Time)
subtest$Datetime<-as.POSIXct(subtest$Datetime)
#Plot2
plot(as.numeric(subtest$Global_active_power)~subtest$Datetime,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
