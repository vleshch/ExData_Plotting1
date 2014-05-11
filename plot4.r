plot4 <- function ()
{
  
  rl<-readLines("household_power_consumption.txt")
  l1 <- which(grepl("^1/2/2007",rl))
  l2 <- which(grepl("^2/2/2007",rl))
  rmin<-min(l1)
  rmax<-max(l2)
  data<-read.table( header = FALSE, sep = ";", quote = "\"'",text=rl[rmin:rmax])
  
  names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  png( "plot4.png", width = 480, height = 480 )
  
  # set size
  par(mfrow=c(2,2))
  
  #plot 1
  plot(data$Global_active_power,t="n",ylab="Global Active Pover (kilowatts)",xlab="",xaxt = "n")
  lines(data$Global_active_power)
  axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
  
  
  #plot2
  plot(data$Voltage,t="n",ylab="Voltage",xlab="datetime",xaxt = "n")
  lines(data$Voltage)
  axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
  
  
  
  #plot 3
  plot(data$Sub_metering_1,t="n",ylab="Energy sub metering",xlab="",xaxt = "n")
  lines(data$Sub_metering_1)
  lines(data$Sub_metering_2,col="red")
  lines(data$Sub_metering_3,col="blue")
  
  legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
  
  
  #plot 4
  plot(data$Global_reactive_power,t="n",ylab="Global_reactive_power",xlab="datetime",xaxt = "n")
  lines(data$Global_reactive_power)
  axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
  
  
  dev.off()
}