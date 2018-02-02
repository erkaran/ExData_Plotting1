##Function to draw plot1
##x:character object that stores name of txt file

source('dataloader.R')

plot1 <- function(x) {
  data <- loadData(x) ##loading data in between given range
  
  png(
    filename = 'plot1.png',
    width = 480,
    height = 480,
    units = 'px'
  )
  
  hist(
    data$Global_active_power,
    main = "Global Active Power",
    col = "red",
    xlab = "Global Active Power (kilowatts)"
  )
  
  ##close graphic device
  dev.off()
  
  ##print if successfull or not in making plot
  if(is.element("plot1.png",list.files())){
    print("Success")
  }
  else{
    print("Fail")
  }
  
}