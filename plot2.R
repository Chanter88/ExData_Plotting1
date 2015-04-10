##this script for constructs the plot2.png
##the "household_power_consumption.txt" data should be in the working directory
##created by alan.gz.li@msn.cn

##read and clean the data
data <- subset(read.table("./household_power_consumption.txt",header = TRUE,sep=";",na.strings="?"),Date=="1/2/2007" | Date=="2/2/2007")

##get the datetime ready
data <- cbind(datetime=strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"),data[,-c(1,2)])

##Open PDF device and create 'plot2.png' in my working directory
png(file="plot2.png",width = 480, height = 480, units = "px",bg = "transparent") 

##constructs the graphic
plot(data$datetime,data$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (Kilowatts)")

##Close the png file device
dev.off() 
