source("load_project_data.R")

# Above script load_project_data.R loads the summary data to data.loaded
# data.loaded only contains data from the dates 2007-02-01 and 2007-02-02.

plot3 <- paste(getwd(), "/plot3.png", sep = "")

png(plot3, width = 480, height = 480)
  plot(
    data.loaded$Time,
    data.loaded$Sub_metering_1,
    type = "l",
    col = "black",
    xlab = "",
    ylab = "Energy sub metering"
  )
  lines(data.loaded$Time,
        data.loaded$Sub_metering_2,
        type = "l",
        col = "red")
  lines(data.loaded$Time,
        data.loaded$Sub_metering_3,
        type = "l",
        col = "blue")
  legend(
    "topright",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lwd = 2,
    col = c("black", "red", "blue")
  )
  dev.off()
