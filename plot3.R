##this script for constructs the plot3.png
##the "household_power_consumption.txt" data should be in the working directory
##created by alan.gz.li@msn.cn

##read and clean the data
data <- subset(read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings="?"),Date=="1/2/2007" | Date=="2/2/2007")

##get the datetime ready
data <- cbind(datetime=strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"),data[,-c(1,2)])

##Open PDF device and create 'plot3.png' in my working directory
png(file="plot3.png",width = 480, height = 480, units = "px",bg = "transparent") 

##constructs the graphic
with(data,plot(datetime,Sub_metering_1,type="n",main="",xlab="",ylab="Energy sub metering"))
with(data,lines(datetime,Sub_metering_1,type="l",col="black"))
with(data,lines(datetime,Sub_metering_2,type="l",col="red"))
with(data,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright", pch = "————", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##Close the png file device
dev.off() 
