##Function to draw plot3
##x:character object that stores name of txt file

source('dataloader.R')

plot3 <- function(x) {
  data <- loadData(x) ##loading data in between given range
  
  
  png(
    filename = 'plot3.png',
    width = 480,
    height = 480,
    units = 'px'
  )
  
  
  ##draw plot
  
  startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
  endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
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
  
  ##close graphic device
  dev.off()
  
  ##print if successfull or not in making plot
  if(is.element("plot3.png",list.files())){
    print("Success")
  }
  else{
    print("Fail")
  }
}