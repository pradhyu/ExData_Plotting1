source("load_project_data.R")

# Above script load_project_data.R loads the summary data to data.loaded
# data.loaded only contains data from the dates 2007-02-01 and 2007-02-02.


plot2 <- paste(getwd(), "/plot2.png", sep = "")
png(plot2, width = 480, height = 480)
plot(
  data.loaded$Time,
  data.loaded$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)
dev.off()
