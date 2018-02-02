##Function to draw plot2
##x:character object that stores name of txt file

source('dataloader.R')

plot2 <- function(x) {
  data <- loadData(x) ##loading data in between given range
  
  
  png(
    filename = 'plot2.png',
    width = 480,
    height = 480,
    units = 'px'
  )
  
  
  ##draw plot
  startDay = as.POSIXct(strftime("2007-02-01 00:00:00"))
  endDay = as.POSIXct(strftime("2007-02-03 00:00:00"))
  plot(data$Time,
       data$Global_active_power,
       xlim=c(startDay, endDay),
       xaxt="n",
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)"
  )
  axis.POSIXct(1, at=seq(startDay, endDay, by="day"), format="%a")
  
  
  ##close graphic device
  dev.off()
  
  ##print if successfull or not in making plot
  if(is.element("plot2.png",list.files())){
    print("Success")
  }
  else{
    print("Fail")
  }
}