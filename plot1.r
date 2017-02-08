
###Get the data#####
test<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE,dec=".")
test$Date<-as.Date(as.character(test$Date),format="%d/%m/%Y")
head(test,5)
###Subset the data##
subtest<-subset(test,Date>="2007-02-01" & Date<="2007-02-02")
#Plot1
hist(as.numeric(subtest$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()
