plot()plot2 <- function ()
{
  
  rl<-readLines("household_power_consumption.txt")
  l1 <- which(grepl("^1/2/2007",rl))
  l2 <- which(grepl("^2/2/2007",rl))
  rmin<-min(l1)
  rmax<-max(l2)
  data<-read.table( header = FALSE, sep = ";", quote = "\"'",text=rl[rmin:rmax])
  
  names(data)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  png( "plot2.png", width = 480, height = 480 )
  
  plot(data$Global_active_power,t="n",ylab="Global Active Pover (kilowatts)",xlab="",xaxt = "n")
  lines(data$Global_active_power)
  axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)), labels=c("Thu","Fri","Sat"))
  
  dev.off()
}