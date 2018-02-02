##Function to draw plot4
##x:character object that stores name of txt file

source('dataloader.R')

plot4 <- function(x) {
  data <- loadData(x) ##loading data in between given range
  
  
  png(
    filename = 'plot4.png',
    width = 480,
    height = 480,
    units = 'px'
  )
  
  
  ##declaring that there are 4 plots and arrangement 
  par(mfrow=c(2,2))
  
  startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
  endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
  
  #plot1
  plot(data$Time,
       data$Global_active_power,
       xlim=c(startDay, endDay),
       xaxt="n",
       type="l",
       xlab="",
       ylab="Global Active Power"
  )
  axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
  
  #plot2
  plot(data$Time,
       data$Voltage,
       xlim=c(startDay, endDay),
       xaxt="n",
       type="l",
       xlab="datetime",
       ylab="Voltage"
  )
  axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
  
  
  #plot3
  plot(data$Time,
       data$Sub_metering_1,
       xlim=c(startDay, endDay),
       xaxt="n",
       type="l",
       xlab="",
       ylab="Energy sub metering"
  )
  
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  
  axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
  
  legend("topright",
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col=c('black', 'red', 'blue'), lty=c(1, 1, 1))
  
  #plot4
  plot(data$Time,
       data$Global_reactive_power,
       xlim=c(startDay, endDay),
       xaxt="n",
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power"
  )
  axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
  
  
  
  ##close graphic device
  dev.off()
  
  ##print if successfull or not in making plot
  if(is.element("plot4.png",list.files())){
    print("Success")
  }
  else{
    print("Fail")
  }
}